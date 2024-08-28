import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const_final_presensi.dart';



Future<void> presensiMasuk(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: const Color(0xCC293241),
    builder: (BuildContext context) {
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue,
                  fixedSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                ),
                child: Text(
                  'Oke',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
