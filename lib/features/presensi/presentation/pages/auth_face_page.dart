import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter_face_api/face_api.dart' as regula;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utils/ekstraksi_fitur_wajah.dart';
import '../../data/models/user_model.dart';
import '../widgets/camera_view.dart';
import 'presensi_masuk.dart';

class AuthenticateFace extends StatefulWidget {
  const AuthenticateFace({super.key});
  @override
  State<AuthenticateFace> createState() => _AuthenticateFaceState();
}

class _AuthenticateFaceState extends State<AuthenticateFace> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );
  FaceFeatures? _faceFeatures;
  var image1 = regula.MatchFacesImage();
  var image2 = regula.MatchFacesImage();
  dynamic userFaceData;
  dynamic userId;

  // Tambahkan variabel untuk menyimpan image yang sudah dicapture
  Uint8List? _capturedImage;
  bool _canAuthenticate = true;
  bool userExists = false;
  UserModel? loggingUser;
  bool isMatching = false;
  int trialNumber = 1;

  // Supabase client
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              CameraView(
                onImage: (image) {
                  _setImage(image);
                },
                onInputImage: (inputImage) async {
                  setState(() => isMatching = true);
                  _faceFeatures = await extractFaceFeatures(
                    inputImage,
                    _faceDetector,
                  );
                  setState(() => isMatching = false);
                },
              ),
              if (_capturedImage != null)
                SizedBox(
                  height: 400,
                  width: 400,
                  child: Image.memory(
                    _capturedImage!,
                    fit: BoxFit.cover, // Agar gambar menutupi seluruh container
                  ),
                ),
              if (_canAuthenticate)
                InkWell(
                  onTap: () async {
                    await _authenticateFace();
                  },
                  child: Container(
                    height: 40,
                    width: 300,
                    color: const Color(0xff2E2E2E),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Center(
                      child: Text(
                        'Autentikasi',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  //encode gambar menjadi base64
  Future _setImage(Uint8List imageToAuthenticate) async {
    image2.bitmap = base64Encode(imageToAuthenticate);
    image2.imageType = regula.ImageType.PRINTED;

    setState(() {
      _canAuthenticate = true;
      _capturedImage = imageToAuthenticate; // Simpan image yang sudah dicapture
    });
  }

  // fungsi untuk menghitung jarak euclidean
  double euclideanDistance(Points p1, Points p2) {
    final sqr = math.sqrt(
      math.pow((p1.x! - p2.x!), 2) + math.pow((p1.y! - p2.y!), 2),
    );
    return sqr;
  }

  // untuk membandingkan fitur wajah yang diambil dengan fitur wajah yang sudah disimpan
  double compareFaces(FaceFeatures face1, FaceFeatures face2) {
    double distEar1 = euclideanDistance(face1.rightEar!, face1.leftEar!);
    double distEar2 = euclideanDistance(face2.rightEar!, face2.leftEar!);

    double ratioEar = distEar1 / distEar2;

    double distEye1 = euclideanDistance(face1.rightEye!, face1.leftEye!);
    double distEye2 = euclideanDistance(face2.rightEye!, face2.leftEye!);

    double ratioEye = distEye1 / distEye2;

    double distCheek1 = euclideanDistance(face1.rightCheek!, face1.leftCheek!);
    double distCheek2 = euclideanDistance(face2.rightCheek!, face2.leftCheek!);

    double ratioCheek = distCheek1 / distCheek2;

    double distMouth1 = euclideanDistance(face1.rightMouth!, face1.leftMouth!);
    double distMouth2 = euclideanDistance(face2.rightMouth!, face2.leftMouth!);

    double ratioMouth = distMouth1 / distMouth2;

    double distNoseToMouth1 = euclideanDistance(
      face1.noseBase!,
      face1.bottomMouth!,
    );
    double distNoseToMouth2 = euclideanDistance(
      face2.noseBase!,
      face2.bottomMouth!,
    );

    double ratioNoseToMouth = distNoseToMouth1 / distNoseToMouth2;

    double ratio =
        (ratioEye + ratioEar + ratioCheek + ratioMouth + ratioNoseToMouth) / 5;
    log(ratio.toString(), name: "Ratio");

    return ratio;
  }

  //fungsi logging untuk debugging
  void _log(message) => print(message);

  //fungsi autentikasi wajah
  Future<void> _authenticateFace() async {
    final scaffoldMessanger = ScaffoldMessenger.of(context);

    try {
      if (_faceFeatures == null) {
        scaffoldMessanger.showSnackBar(
          const SnackBar(content: Text("Tidak ada wajah yang terdeteksi.")),
        );
        _log("Error: Tidak ada wajah yang terdeteksi.");
        return;
      }

      // Ambil data pengguna dari Supabase
      _log("Mengambil data wajah dari Supabase...");
      final response =
          await supabase
              .from('users')
              .select(); // ambil semua data dari tabel users

      // Logging hasil respons dari Supabase
      _log("Supabase Response: $response");

      // cek apakah ada data atau tidak dalam response
      if (response.isEmpty) {
        scaffoldMessanger.showSnackBar(
          const SnackBar(content: Text("Tidak ada pengguna di database.")),
        );
        _log("Error: Tidak ada pengguna di database.");
        return;
      }

      // Ambil wajah pertama dari Supabase untuk membandingkan (misalnya id 1)
      _log("Mengambil data wajah dari database...");
      // var userFaceData = response[0]['face_features'];
      for (var user in response) {
        userId = user['id'];
        userFaceData = user['face_features'];
        _log("User ID: ${user['id']}, Name: ${user['name']}");
        _log("Face Features: ${user['face_features']}");
      }

      // Logging data wajah yang diambil dari Supabase
      _log("Face Features from Supabase: $userFaceData");

      // Jika ada error dalam mengambil fitur wajah, kita tangani
      if (userFaceData == null) {
        scaffoldMessanger.showSnackBar(
          const SnackBar(
            content: Text("Data fitur wajah pengguna tidak ditemukan."),
          ),
        );
        _log("Error: Data fitur wajah pengguna tidak ditemukan.");
        return;
      }

      // Konversi data wajah dari JSON ke objek FaceFeatures
      FaceFeatures faceFromDb = FaceFeatures.fromJson(userFaceData);

      // Bandingkan wajah yang terdaftar dengan wajah yang baru
      _log("Membandingkan wajah...");
      double similarityRatio = compareFaces(faceFromDb, _faceFeatures!);

      // Logging hasil perbandingan wajah
      _log("Similarity Ratio: $similarityRatio");

      if (similarityRatio > 0.80) {
        // 95% threshold untuk identifikasi yang cocok
        scaffoldMessanger.showSnackBar(
          const SnackBar(content: Text("Wajah cocok! Akses diberikan.")),
        );
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
            (context),
            MaterialPageRoute(
              builder: ((context) => const PresensiMasukPage()),
            ),
          );
        });

        _log("Wajah cocok, akses diberikan.");
      } else {
        scaffoldMessanger.showSnackBar(
          const SnackBar(content: Text("Wajah tidak cocok!")),
        );
        _log("Wajah tidak cocok.");
      }
    } catch (e, stackTrace) {
      // Jika ada error lain, tampilkan pesan error di Snackbar
      scaffoldMessanger.showSnackBar(
        SnackBar(content: Text("Autentikasi gagal: $e")),
      );

      // Logging error dan stack trace untuk detail debugging
      _log("Error: $e");
      _log("Stack trace: $stackTrace");
    }
  }
}
