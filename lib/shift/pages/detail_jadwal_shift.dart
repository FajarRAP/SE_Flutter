import 'package:flutter/material.dart';

import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';


class DetailPageJadwalShift extends StatefulWidget {
  const DetailPageJadwalShift({super.key});

  @override
  State<DetailPageJadwalShift> createState() => _DetailPageJadwalShiftState();
}

class _DetailPageJadwalShiftState extends State<DetailPageJadwalShift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Detail Jadwal Shift', 
        style: kPoppinsSemiBold.copyWith(
          fontSize: SizeConfig.blockSizeHorizontal! * 3.00,
          color: kBlack,
        ),)
      ),
    );
  }
}