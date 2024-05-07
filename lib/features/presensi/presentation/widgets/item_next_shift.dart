import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/shift_berikutnya_model.dart';

class ItemNextShift extends StatelessWidget {
  final DataShiftBerikutnya dataShift;
  const ItemNextShift({
    super.key,
    required this.dataShift,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataShift.shiftNama,
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kBlack,
                ),
              ),
              Text(
                dataShift.tanggal,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kNeutral90,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/tunjangan-beras-location.svg'),
                  const SizedBox(width: 4),
                  Text(
                    dataShift.lokasi,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kNeutral90,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/pukul.svg',
                    colorFilter: const ColorFilter.mode(
                      kGreen,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${dataShift.shiftMasuk} - ${dataShift.shiftPulang}',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kNeutral90,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
