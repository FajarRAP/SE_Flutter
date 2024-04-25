import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';

class ToNotification extends StatelessWidget {
  const ToNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   PageTransition(
        //     duration: const Duration(milliseconds: 100),
        //     child: const NotifikasiKosong(),
        //     type: PageTransitionType.fade,
        //   ),
        // );
      },
      child: SvgPicture.asset(
        'assets/icons/notif.svg',
        width: 32,
        colorFilter: const ColorFilter.mode(kBlack, BlendMode.srcIn),
      ),
    );
  }
}
