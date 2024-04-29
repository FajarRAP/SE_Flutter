import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class GajiNotExist extends StatelessWidget {
  const GajiNotExist({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          SvgPicture.asset(emptyDataSvg),
          const SizedBox(height: 24),
          Text(
            'Tidak ada gaji',
            style: Styles.kPoppinsSemiBold.copyWith(
              color: kBlack,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Tidak dapat menampilkan daftar gaji',
            textAlign: TextAlign.center,
            style: Styles.kNunitoRegular.copyWith(
              color: kNeutral90,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
