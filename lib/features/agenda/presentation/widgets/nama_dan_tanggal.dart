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
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: kBlue,
            borderRadius: BorderRadiusDirectional.circular(4),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: Styles.kPoppinsMedium.copyWith(
                  fontSize: 24,
                  color: kBlack,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                tanggal,
                style: Styles.kNunitoRegular.copyWith(
                  fontSize: 16,
                  color: kNeutral80,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
