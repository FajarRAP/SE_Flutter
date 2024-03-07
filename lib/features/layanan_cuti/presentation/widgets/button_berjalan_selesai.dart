import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class ButtonBerjalanSelesai extends StatelessWidget {
  final String kata;
  final Color warnaBg;
  final Color warnaFont;
  const ButtonBerjalanSelesai({
    super.key,
    required this.kata,
    required this.warnaBg,
    required this.warnaFont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.kSize32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Screen.kSize12,
        ),
        color: warnaBg,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Screen.kSize16,
        vertical: Screen.kSize8,
      ),
      child: Center(
        child: Text(
          kata,
          style: Styles.kPoppinsRegular.copyWith(
            color: warnaFont,
            fontSize: Screen.kSize12,
          ),
        ),
      ),
    );
  }
}
