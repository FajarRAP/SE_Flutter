import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';


class ExtraProfile extends StatelessWidget {
  final String path;
  final String title;
  final String subtitle;
  const ExtraProfile({
    super.key,
    required this.path,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(path),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.kPoppinsRegular.copyWith(
                  color: kNeutral80,
                ),
              ),
              Text(
                subtitle,
                style: Styles.kNunitoSemiBold.copyWith(
                  color: kBlack,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
