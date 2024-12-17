import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class DetailGajiKosong extends StatelessWidget {
  const DetailGajiKosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          SvgPicture.asset(
              'assets/icons/libur-jadwal-perkuliahan.svg'),
          SizedBox(
            height: 24,
          ),
          Text(
            'Tidak ada gaji',
            style: Styles.kPoppinsSemiBold
                .copyWith(fontSize: 18, color: kBlack),
          ),
          SizedBox(height: 24),
          Text(
            'Tidak dapat menampilkan daftar \n gaji',
            textAlign: TextAlign.center,
            style: Styles.kNunitoRegular
                .copyWith(fontSize: 14, color: kNeutral90),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}