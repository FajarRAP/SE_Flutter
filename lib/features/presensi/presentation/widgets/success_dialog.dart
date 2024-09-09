import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const_final_presensi.dart';



Future<void> presensiMasukSuccessDialog(BuildContext context) async {
  showDialog<void>(
    context: context,
    barrierColor: const Color(0xCC293241),
    builder: (BuildContext dialogContext) {
      // Pastikan dialogContext digunakan untuk pop setelah delay
      Future.delayed(const Duration(seconds: 3), () {
        if (Navigator.of(dialogContext).canPop()) {
          Navigator.of(dialogContext).pop();
        }
      });

      return AlertDialog(
        contentPadding: const EdgeInsets.all(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/check.svg'),
            const SizedBox(height: 24),
            Text(
              'Presensi Masuk Berhasil',
              textAlign: TextAlign.center,
              style: Styles.kPoppinsSemiBold.copyWith(
                color: kBlack,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      );
    },
  );
}
