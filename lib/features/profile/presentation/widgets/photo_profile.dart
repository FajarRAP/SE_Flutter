import 'package:flutter/material.dart';

import 'change_photo_modal.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/home-profil.png',
            fit: BoxFit.cover,
            width: 90,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () => changePhotoModal(context),
                child: const CircleAvatar(
                  backgroundColor: Color(0xFF006EB8),
                  foregroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
