import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

import 'presensi_masuk.dart';

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

  Future<String> saveImageToLocalStorage(XFile image) async {
    try {
      // Dapatkan path ke direktori aplikasi lokal
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String imagePath = '${appDirectory.path}/${DateTime.now()}.jpg';

      // Simpan file gambar ke local storage
      final File localImage = File(imagePath);
      await image.saveTo(localImage.path);

      print("Gambar disimpan di: $imagePath");
      return imagePath; // Return path gambar yang disimpan
    } catch (e) {
      print("Error menyimpan gambar: $e");
      return ''; // Return empty string jika terjadi error
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
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
                    // Ambil foto menggunakan kamera
                    final image = await cameraController!.takePicture();
                    if (!mounted) return;

                    // Simpan gambar dan dapatkan path-nya
                    final imagePath = await saveImageToLocalStorage(image);

                    // Kirim path gambar ke halaman berikutnya
                    if (imagePath.isNotEmpty) {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PresensiMasukPage(imagePath: imagePath),
                      //   ),
                      // );
                      Navigator.pop(context, image.path);
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
}
