import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

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
    return Container(
      decoration: ShapeDecoration(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Screen.kSize12,
          ),
        ),
        shadows: boxShadow,
      ),
      width: Screen.width * .275,
      height: Screen.kSize40 * 2 + 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teks,
            style: Styles.kNunitoMedium.copyWith(
              color: kGrey,
              fontSize: Screen.kSize14,
            ),
          ),
          Text(
            angka,
            style: Styles.kPoppinsSemiBold.copyWith(
              color: warna,
              fontSize: Screen.kSize32,
            ),
          ),
        ],
      ),
    );
  }
}
