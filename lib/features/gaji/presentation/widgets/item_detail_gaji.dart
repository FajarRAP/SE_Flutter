import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class ItemDetailGaji extends StatelessWidget {
  final bool isPemasukan;
  final String nominal;
  final String keterangan;
  const ItemDetailGaji({
    super.key,
    required this.isPemasukan,
    required this.nominal,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadow,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SvgPicture.asset(
            isPemasukan ? pemasukanSvg : pengeluaranSvg,
            width: 40,
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nominal,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlack,
                  fontSize: 18,
                ),
              ),
              Text(
                keterangan,
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
