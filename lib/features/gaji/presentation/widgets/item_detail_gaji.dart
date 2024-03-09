import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class ItemDetailGaji extends StatelessWidget {
  final String gambar;
  final String nominal;
  final String keterangan;
  const ItemDetailGaji({
    super.key,
    required this.gambar,
    required this.nominal,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: boxShadow,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            gambar,
            width: 40,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nominal,
                style: Styles.kPoppinsMedium.copyWith(
                  fontSize: 18,
                  color: kBlack,
                ),
              ),
              Text(
                keterangan,
                style: Styles.kNunitoRegular.copyWith(
                  fontSize: 14,
                  color: kNeutral90,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}