import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class CardMasuk extends StatelessWidget {
  const CardMasuk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x087281DF),
            blurRadius: 4.11,
            offset: Offset(0, 0.52),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0C7281DF),
            blurRadius: 6.99,
            offset: Offset(0, 1.78),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0F7281DF),
            blurRadius: 10.20,
            offset: Offset(0, 4.11),
            spreadRadius: 0,
          )
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/presensi-masuk-2.svg'),
              const SizedBox(width: 8),
              Text(
                'Masuk',
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlack,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Belum Presensi',
            style: Styles.kPoppinsSemiBold.copyWith(
              color: kRed,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Masuk UAD',
            style: Styles.kNunitoRegular.copyWith(
              color: kNeutral90,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
