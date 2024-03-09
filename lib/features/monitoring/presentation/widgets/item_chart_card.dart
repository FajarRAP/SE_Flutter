import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class ItemChartCard extends StatelessWidget {
  final String kata;
  final int value;
  final Color warna;
  const ItemChartCard({
    super.key,
    required this.kata,
    required this.value,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Screen.kSize16,
          vertical: Screen.kSize14,
        ),
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Screen.kSize12,
            ),
          ),
          shadows: boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kata,
              style: Styles.kNunitoMedium.copyWith(
                fontSize: Screen.kSize14,
                color: kNeutral90,
              ),
            ),
            SizedBox(
              height: Screen.kSize4,
            ),
            Text(
              value.toString(),
              style: Styles.kPoppinsSemiBold.copyWith(
                fontSize: Screen.kSize28,
                color: warna,
              ),
            )
          ],
        ),
      ),
    );
  }
}
