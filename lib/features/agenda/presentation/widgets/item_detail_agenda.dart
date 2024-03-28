import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class ItemDetailAgenda extends StatelessWidget {
  final String kata;
  final String keterangan;

  const ItemDetailAgenda({
    super.key,
    required this.kata,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/agenda-${kata.toLowerCase()}.svg',
          width: 40,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kata,
                style: Styles.kPoppinsRegular.copyWith(
                  color: kNeutral80,
                  fontSize: 14,
                ),
              ),
              Text(
                keterangan,
                style: Styles.kNunitoSemiBold.copyWith(
                  color: kBlack,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
