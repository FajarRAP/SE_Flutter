import 'package:flutter/material.dart';

import '../../utils/cuti_constant_finals.dart';

class ButtonBerjalanSelesai extends StatelessWidget {
  final String kata;
  final bool isBerjalan;
  const ButtonBerjalanSelesai({
    super.key,
    required this.kata,
    required this.isBerjalan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isBerjalan ? bgButton : kLightGrey,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Center(
        child: Text(
          kata,
          style: Styles.kPoppinsRegular.copyWith(
            color: isBerjalan ? kWhite : kNeutral60,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
