import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

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
    return const Center();
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [],
    //   ),
    // );
  }

  Future _getImage() async {
    final pickedFile = await _imagePicker?.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
      maxHeight: 400,
      imageQuality: 100
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
