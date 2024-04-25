import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'core/constants_finals.dart';
import 'features/login/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const Login(),
      pageTransitionType: PageTransitionType.fade,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: Screen.width,
      splash: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/logo-adisty.svg',
              width: Screen.width * .3,
            ),
            SizedBox(
              height: Screen.kSize16,
            ),
            Text(
              'Selamat Datang',
              style:
                  Styles.kPoppinsSemiBold.copyWith(fontSize: Screen.kSize20, color: kBlack),
            ),
            Text(
              'di ADISTY',
              style:
                  Styles.kPoppinsSemiBold.copyWith(fontSize: Screen.kSize20, color: kBlack),
            )
          ],
        ),
      ),
    );
    // child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
