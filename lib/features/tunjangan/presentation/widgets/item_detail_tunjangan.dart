import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class ItemDetailTunjangan extends StatelessWidget {
  final String title;
  final String value;
  const ItemDetailTunjangan({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/tunjangan-beras-${title.toLowerCase()}.svg',
        ),

        const SizedBox(width: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.kPoppinsRegular.copyWith(
                color: kNeutral80,
                fontSize: 14,
              ),
            ),
            Text(
              value,
              style: Styles.kNunitoSemiBold.copyWith(
                color: kBlack,
                fontSize: 16,
              ),
            )
          ],
        )
      ],
    );
  }
}
