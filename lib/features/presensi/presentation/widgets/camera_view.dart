import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.onImage,
    required this.onInputImage,
  }) : super(key: key);

  final Function(Uint8List image) onImage;
  final Function(InputImage inputImage) onInputImage;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? _image;
  ImagePicker? _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [          
          // _image != null
          //     ? CircleAvatar(
          //         radius: 150,
          //         backgroundColor: const Color(0xffD9D9D9),
          //         backgroundImage: FileImage(_image!),
          //       )
          //     : const CircleAvatar(
          //         radius: 150,
          //         backgroundColor: Color(0xffD9D9D9),
          //         child: Icon(
          //           Icons.camera_alt,
          //           size: 50,
          //           color: Color(0xff2E2E2E),
          //         ),
          //       ),
          // GestureDetector(
          //   onTap: _getImage,
          //   child: Container(
          //     height: 70,
          //     width: 70,
          //     margin: const EdgeInsets.only(top: 44, bottom: 20),
          //     decoration: const BoxDecoration(
          //       color: kRed,
          //       shape: BoxShape.circle,
          //     ),
          //     child: const Icon(
          //       Icons.camera_alt,
          //       color: kBlack,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future _getImage() async {
    final pickedFile = await _imagePicker?.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
      maxHeight: 400,
    );
    if (pickedFile != null) {
      _setPickedFile(pickedFile);
    }
  }

  Future _setPickedFile(XFile pickedFile) async {
    final path = pickedFile.path;
    setState(() {
      _image = File(path);
    });

    Uint8List imageBytes = await _image!.readAsBytes();
    widget.onImage(imageBytes);

    InputImage inputImage = InputImage.fromFilePath(path);
    widget.onInputImage(inputImage);
  }
}
