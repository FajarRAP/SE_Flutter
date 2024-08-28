import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../const_final_presensi.dart';



class CardBelowChart extends StatelessWidget {
  final String jenis;
  final String path;
  final String data;
  final String keterangan;
  const CardBelowChart({
    super.key,
    required this.jenis,
    required this.path,
    required this.data,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: boxShadow,
          color: kWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/$path'),
                const SizedBox(width: 8),
                Text(
                  jenis,
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kBlack,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              data,
              style: Styles.kPoppinsSemiBold.copyWith(
                color: kBlack,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              keterangan,
              style: Styles.kNunitoRegular.copyWith(
                color: kNeutral90,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
