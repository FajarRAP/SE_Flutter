import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/shift_constant_finals.dart';



class ShiftNotExist extends StatelessWidget {
  const ShiftNotExist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(emptyDataSvg),
          const SizedBox(height: 24),
          Text(
            'Tidak ada jadwal shift',
            style: Styles.kPoppinsSemiBold.copyWith(
              color: kBlack,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Hari ini anda tidak memiliki jadwal shift',
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
