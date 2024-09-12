import 'dart:async';
import 'dart:io';

import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class PresensiCamera extends StatefulWidget {
  const PresensiCamera({super.key});

  @override
  State<PresensiCamera> createState() => _PresensiCameraState();
}

class _PresensiCameraState extends State<PresensiCamera> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  //fungsi untuk memulai kamera
  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[1], ResolutionPreset.medium,
        enableAudio: false);

    await cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((onError) {
      print(onError);
    });
    setState(() {});
  }

  //fungsi untuk menyimpan image ke local storage
  Future<String> saveImageToLocalStorage(XFile image) async {
    try {
      // dapat path ke direktori aplikasi lokal
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String imagePath = '${appDirectory.path}/${DateTime.now()}.jpg';

      // simpan ke local storage
      final File localImage = File(imagePath);
      await image.saveTo(localImage.path);

      print("Gambar disimpan di: $imagePath");
      // return path gambar
      return imagePath;
    } catch (e) {
      print("Error menyimpan gambar: $e");
      return ''; // return empty string jika terjadi error
    }
  }

  //fungsi untuk deteksi wajah
  Future<void> detectFace(String imagePath) async {
    final InputImage inputImage = InputImage.fromFilePath(imagePath);
    final faceDetector = FaceDetector(
      options: FaceDetectorOptions(
          enableContours: true, enableLandmarks: true, enableTracking: true),
    );

    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (faces.isEmpty) {
      print('wajah tidak terdeteksi');
    } else {
      print('wajah terdeteksi: ${faces.length}');
    }
    faceDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return cameraController == null
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: kBlue,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CameraPreview(cameraController!)),
                ],
              ),
            ),
            floatingActionButton: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final image = await cameraController!.takePicture();
                    if (!mounted) return;
                    final imagePath = await saveImageToLocalStorage(image);
                    if (imagePath.isNotEmpty) {
                      // // Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => PresensiMasukPage(imagePath: imagePath))));
                      // Navigator.pop(context, imagePath);
                      await detectFace(imagePath);
                      Navigator.pop(context, imagePath);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue,
                  fixedSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Ambil Foto',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            resizeToAvoidBottomInset: false,
          );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
