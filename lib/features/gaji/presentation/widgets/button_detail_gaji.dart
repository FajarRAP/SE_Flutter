import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class ButtonDetailGaji extends StatelessWidget {
  final String kata;
  final Color warnaBg;
  final Color warnaFont;
  final void Function() onTap;
  const ButtonDetailGaji({
    super.key,
    required this.kata,
    required this.warnaBg,
    required this.warnaFont,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: warnaBg,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Center(
          child: Text(
            kata,
            style: Styles.kPoppinsRegular.copyWith(
              color: warnaFont,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
