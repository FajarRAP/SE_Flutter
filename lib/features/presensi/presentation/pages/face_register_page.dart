import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../../utils/ekstraksi_fitur_wajah.dart';
import '../../data/models/user_model.dart';
import '../widgets/camera_view.dart';
import 'detail_user.dart';

class FaceRecognitionPage extends StatefulWidget {
  const FaceRecognitionPage({super.key});

  @override
  State<FaceRecognitionPage> createState() => _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );
  String? _image;
  FaceFeatures? _faceFeatures;

  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Spacer(),
          CameraView(
            onImage: (image) {
              setState(() {
                _image = base64Encode(image);
              });
            },
            onInputImage: (inputImage) async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: Colors.green[400],
                  ),
                ),
              );
              _faceFeatures =
                  await extractFaceFeatures(inputImage, _faceDetector);
              setState(() {});
              if (mounted) Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          if (_image != null && _faceFeatures != null)
            GestureDetector(
              onTap: () async {
                try {
                  var uuid = Uuid();
                  String userId = uuid.v4();

                  // Save to Supabase
                  final response = await supabase.from('users').insert({
                    'id': userId,
                    'name': 'Lalu',
                    'image': _image,
                    'face_features': _faceFeatures?.toJson(),
                    'registered_on': DateTime.now().toIso8601String(),
                  });
                    // Jika berhasil, lakukan navigasi ke halaman DetailUser
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailUser(),
                      ),
                    );
                } catch (e) {
                  // Jika error, tampilkan snackbar error
                  print('Error saving user: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to save user!'),
                    ),
                  );
                }
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'Daftarkan Wajah',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }
}
