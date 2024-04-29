import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/lokasi-presensi.svg'),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Lokasi di luar UAD',
                    style: Styles.kPoppinsMedium.copyWith(
                      fontSize: 16,
                      color: kBlack,
                    ),
                  ),
                )
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Text(
                  'Transport',
                  style: Styles.kNunitoRegular.copyWith(
                    color: kNeutral90,
                  ),
                ),
                Text(
                  'Rp 20.000',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kBlack,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
