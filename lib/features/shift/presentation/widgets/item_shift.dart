import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/shift_model.dart';

class ItemShift extends StatelessWidget {
  final DataShiftModel dataShift;

  const ItemShift({
    super.key,
    required this.dataShift,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: boxShadow,
      ),
      child: Column(
        children: [
          // Nama dan Waktu Shift
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataShift.namaShift,
                style: Styles.kPoppinsSemiBold.copyWith(
                  fontSize: 14,
                  color: kBlack,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Pukul',
                    style: Styles.kPoppinsRegular.copyWith(
                      fontSize: 14,
                      color: kNeutral90,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    dataShift.waktuShift,
                    style: Styles.kPoppinsMedium.copyWith(
                      fontSize: 14,
                      color: kBlue,
                    ),
                  )
                ],
              ),
            ],
          ),

          const Divider(),

          // Lokasi
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/tunjangan-beras-location.svg',
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                dataShift.lokasiShift,
                style: Styles.kPoppinsMedium.copyWith(
                  fontSize: 14,
                  color: kNeutral90,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
