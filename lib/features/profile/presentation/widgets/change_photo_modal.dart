import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

Future<void> changePhotoModal(BuildContext context) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: kNeutral50,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/galery.svg',
                      width: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Galeri',
                      style: Styles.kNunitoSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 40),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/camera.svg',
                      width: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Kamera',
                      style: Styles.kNunitoSemiBold.copyWith(
                        color: kBlack,
                        fontSize: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}
