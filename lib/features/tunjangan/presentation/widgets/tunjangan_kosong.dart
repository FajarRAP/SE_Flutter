import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class TunjanganKosong extends StatelessWidget {
  const TunjanganKosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Screen.kSize32,
          ),
          SvgPicture.asset('assets/icons/libur-jadwal-perkuliahan.svg'),
          SizedBox(
            height: Screen.kSize24,
          ),
          SizedBox(
            height: Screen.kSize40,
          )
        ],
      ),
    );
  }
}
