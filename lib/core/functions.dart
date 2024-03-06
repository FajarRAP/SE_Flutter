import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'constants_finals.dart';

Future<DateTime?> ourMonthPicker(BuildContext context) {
  return showMonthPicker(
    context: context,
    backgroundColor: Colors.white,
    selectedMonthTextColor: kWhite,
    headerColor: kBlue,
    unselectedMonthTextColor: kBlue,
    selectedMonthBackgroundColor: kBlue,
    cancelWidget: const Text(
      'Batal',
      style: TextStyle(color: kGrey),
    ),
    confirmWidget: const Text(
      'Konfirmasi',
      style: TextStyle(color: kGrey),
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
        contentPadding: EdgeInsets.all(
          Screen.kSize40,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Screen.kSize24,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/check.svg'),
            SizedBox(height: Screen.kSize24),
            Text(
              kata,
              style: Styles.kPoppinsSemiBold.copyWith(
                color: kBlack,
                fontSize: Screen.kSize20,
              ),
            ),
            SizedBox(height: Screen.kSize8),
            Text(
              keterangan,
              textAlign: TextAlign.center,
              style: Styles.kNunitoRegular.copyWith(
                color: kNeutral70,
                fontSize: Screen.kSize14,
              ),
            ),
            SizedBox(height: Screen.kSize40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: kBlue,
                fixedSize: Size(
                  Screen.width,
                  Screen.kSize40 + Screen.kSize16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Screen.kSize40,
                  ),
                ),
              ),
              child: Text(
                'Oke',
                style: Styles.kPoppinsMedium.copyWith(
                  color: kWhite,
                  fontSize: Screen.kSize16,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
