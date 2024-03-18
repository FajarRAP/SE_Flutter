
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/detail_gaji_model.dart';

class ItemDetailGaji extends StatelessWidget {
  final DataDetailGaji dataDetailGaji;
  final int current;

  const ItemDetailGaji(
      {super.key, required this.dataDetailGaji, required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Screen.kSize16, vertical: Screen.kSize16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
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
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            current == 0
                ? 'assets/icons/pemasukan.svg'
                : 'assets/icons/potongan.svg',
            width: Screen.kSize40,
          ),
          SizedBox(width: Screen.kSize16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataDetailGaji.nominal,
                style: Styles.kPoppinsMedium
                    .copyWith(fontSize: Screen.kSize18, color: kBlack),
              ),
              Text(
                dataDetailGaji.keterangan,
                style: Styles.kNunitoRegular
                    .copyWith(fontSize: Screen.kSize14, color: kNeutral90),
              )
            ],
          )
        ],
      ),
    );
  }
}
