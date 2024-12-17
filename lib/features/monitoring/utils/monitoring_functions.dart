import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'monitoring_constants_finals.dart';


Future<DateTime?> ourMonthPicker(BuildContext context) {
  return showMonthPicker(
    context: context,
    backgroundColor: kWhite,
    selectedMonthTextColor: kWhite,
    headerColor: kBlue,
    unselectedMonthTextColor: kBlue,
    selectedMonthBackgroundColor: kBlue,
    cancelWidget: const Text(
      'Batal',
      style: TextStyle(
        color: kGrey,
      ),
    ),
    confirmWidget: const Text(
      'Konfirmasi',
      style: TextStyle(
        color: kGrey,
      ),
    ),
  );
}

Future<void> successDialog(
  BuildContext context,
  String kata,
  String keterangan,
) {
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
            const SizedBox(
              height: 24,
            ),
            Text(
              kata,
              style: Styles.kPoppinsSemiBold.copyWith(
                color: kBlack,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              keterangan,
              textAlign: TextAlign.center,
              style: Styles.kNunitoRegular.copyWith(
                color: kNeutral70,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kBlue,
                fixedSize: Size(
                  Screen.width,
                  56,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Text(
                'Oke',
                style: Styles.kPoppinsMedium.copyWith(
                  color: kWhite,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
