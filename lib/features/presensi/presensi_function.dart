import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import 'const_final_presensi.dart';

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