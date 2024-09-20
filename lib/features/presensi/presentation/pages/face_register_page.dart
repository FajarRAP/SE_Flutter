import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import '../../../../core/constants_finals.dart';
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
              print('Data Face Features: ${_faceFeatures?.toJson()}');
            },
          ),
          const Spacer(),
          if (_image != null)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailUser(
                    image: _image!,
                    faceFeatures: _faceFeatures!,
                  ),
                ),
              );
            },
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kBlue,
              ),
              child: Center(
                child: Text(
                  'Daftarkan Wajah',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kWhite,
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
