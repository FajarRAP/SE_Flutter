import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants_finals.dart';
import '../../../../utils/ekstraksi_fitur_wajah.dart';
import '../../data/models/user_model.dart';
import '../widgets/camera_view.dart';
import 'auth_face_page.dart';

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
  bool _isLoading = false;

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
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: kBlue,
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
              onTap: _isLoading
                  ? null // Disable button when loading
                  : () async {
                      setState(() {
                        _isLoading = true; // Start loading
                      });
                      try {
                        var uuid = Uuid();
                        String userId = uuid.v4();

                        // data yang akan dikirim ke Supabase
                        final response = await supabase.from('users').insert({
                          'id': userId,
                          'name': 'Lalu',
                          'image': _image,
                          'face_features': _faceFeatures?.toJson(),
                          'registered_on': DateTime.now().toIso8601String(),
                        }).select();

                        // Check if the response is valid
                        if (response.isNotEmpty) {
                          // Jika berhasil, tampilkan snackbar sukses dan navigasi
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('User berhasil disimpan!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthenticateFace(),
                              ),
                            );
                          });
                        } else {
                          // Jika respons kosong, lempar error
                          throw Exception(
                              'Insert failed: No response returned from Supabase');
                        }
                      } catch (e) {
                        // Tampilkan snackbar error jika gagal menyimpan
                        print('Error saving user: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal menyimpan data!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } finally {
                        setState(() {
                          _isLoading = false; // Stop loading
                        });
                      }
                    },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _isLoading ? Colors.grey : Colors.blue,
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
