import 'package:flutter/material.dart';

import '../../utils/monitoring_constants_finals.dart';

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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow,
          color: kWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kata,
              style: Styles.kNunitoMedium.copyWith(
                color: kNeutral90,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              value.toString(),
              style: Styles.kPoppinsSemiBold.copyWith(
                color: warna,
                fontSize: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
