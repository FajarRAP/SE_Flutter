import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class AgendaNotExist extends StatelessWidget {
  const AgendaNotExist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(emptyDataSvg),
        const SizedBox(height: 24),
        Text(
          'Saat ini tidak ada agenda',
          style: Styles.kPoppinsSemiBold.copyWith(
            color: kBlack,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Anda belum memiliki agenda',
          textAlign: TextAlign.center,
          style: Styles.kNunitoRegular.copyWith(
            color: kNeutral90,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
