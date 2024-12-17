import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

class NamaDanTanggal extends StatelessWidget {
  final String nama;
  final String tanggal;
  const NamaDanTanggal({
    super.key,
    required this.nama,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(4),
            color: kBlue,
          ),
          height: 18,
          width: 18,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlack,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                tanggal,
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral80,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
