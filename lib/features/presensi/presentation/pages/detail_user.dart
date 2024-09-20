import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';

class DetailUser extends StatelessWidget {
  final String image;
  final FaceFeatures faceFeatures;
  const DetailUser({
    Key? key,
    required this.image,
    required this.faceFeatures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mak Kau Hijau'),
      ),
    );
  }
}
