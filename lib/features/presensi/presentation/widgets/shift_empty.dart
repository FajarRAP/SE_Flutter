import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class ShiftEmpty extends StatelessWidget {
  const ShiftEmpty({
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
            'Tidak ada Shift',
            style: Styles.kPoppinsSemiBold.copyWith(
              color: kBlack,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Anda belum memiliki Shift',
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
