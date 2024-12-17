import 'package:flutter/material.dart';

import '../../utils/cuti_constant_finals.dart';

class ItemRekapCuti extends StatelessWidget {
  final String teks;
  final String angka;
  final Color warna;
  const ItemRekapCuti({
    super.key,
    required this.teks,
    required this.angka,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow,
          color: kWhite,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              teks,
              style: Styles.kNunitoMedium.copyWith(
                color: kGrey,
                fontSize: 14,
              ),
            ),
            Text(
              angka,
              style: Styles.kPoppinsSemiBold.copyWith(
                color: warna,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
