import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/constants_finals.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Container(),
      nextRoute: loginRoute,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.infinity,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/logo-adisty.svg',
            width: 125,
          ),
          const SizedBox(height: 16),
          Text(
            'Selamat Datang\ndi ADISTY',
            textAlign: TextAlign.center,
            style: Styles.kPoppinsSemiBold.copyWith(
              color: kBlack,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
