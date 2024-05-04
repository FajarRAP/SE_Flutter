// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';
import 'lupa_password.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLockPassword = false;

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Screen.height * .08,
                  ),
                  SvgPicture.asset(
                    'assets/icons/logo-adisty.svg',
                    width: Screen.width * .2,
                  ),
                  SizedBox(
                    height: Screen.kSize4,
                  ),
                  Text(
                    'ADISTY',
                    style: Styles.kPoppinsBold.copyWith(
                        fontSize: Screen.kSize20, color: const Color(0xFF016EB8)),
                  ),
                  SizedBox(
                    height: Screen.height * .08,
                  ),
                  Text(
                    'Login Yuk!',
                    style:
                        Styles.kPoppinsBold.copyWith(fontSize: Screen.kSize28, color: kBlack),
                  ),
                  SizedBox(
                    height: Screen.kSize12,
                  ),
                  Text(
                    'Silakan masuk untuk melanjutkan',
                    style: Styles.kNunitoRegular.copyWith(
                        fontSize: Screen.kSize14, color: kGrey),
                  ),
                  SizedBox(
                    height: Screen.kSize32,
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      isDense: true,
                      floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                          // backgroundColor: kLightGrey,
                          color: kGrey,
                          fontSize: Screen.kSize16),
                      labelText: 'Username',
                      contentPadding: EdgeInsets.only(
                        left: Screen.kSize16,
                        top: Screen.kSize20,
                        bottom: Screen.kSize20,
                      ),
                      labelStyle: Styles.kNunitoRegular.copyWith(
                          color: kNeutral70, fontSize: Screen.kSize16),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FB),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Menentukan border radius
                        borderSide: const BorderSide(
                          color: kBlue,
                        ), // Menghilangkan sisi border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Menentukan border radius
                        borderSide: const BorderSide(
                          color: Color(0xFFE8ECF4),
                        ), // Menghilangkan sisi border
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  TextFormField(
                    obscureText: isLockPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      isDense: true,
                      floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                          // backgroundColor: kLightGrey,
                          color: kGrey,
                          fontSize: Screen.kSize16),
                      labelText: 'Password',
                      contentPadding: EdgeInsets.only(
                        left: Screen.kSize16,
                        top: Screen.kSize20,
                        bottom: Screen.kSize20,
                      ),
                      labelStyle: Styles.kNunitoRegular.copyWith(
                          color: kNeutral70, fontSize: Screen.kSize16),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FB),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isLockPassword = !isLockPassword;
                          });
                        },
                        child: isLockPassword
                            ? SvgPicture.asset(
                                'assets/icons/eye.svg',
                                color: kNeutral80,
                                fit: BoxFit.scaleDown,
                              )
                            : SvgPicture.asset('assets/icons/eye-slash.svg',
                                color: kNeutral80, fit: BoxFit.scaleDown),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Menentukan border radius
                        borderSide: const BorderSide(
                          color: kBlue,
                        ), // Menghilangkan sisi border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Menentukan border radius
                        borderSide: const BorderSide(
                          color: Color(0xFFE8ECF4),
                        ), // Menghilangkan sisi border
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 100),
                            child: const LupaPassword(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Text(
                        'Lupa password?',
                        style: Styles.kPoppinsMedium.copyWith(
                            fontSize: Screen.kSize16, color: kBlue),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: passwordController.text.isNotEmpty &&
                                usernameController.text.isNotEmpty
                            ? const Color(0xFF2B86C4)
                            : kNeutral70,
                        fixedSize: Size(Screen.width, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text(
                      'Masuk',
                      style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (passwordController.text.isNotEmpty &&
        usernameController.text.isNotEmpty) {
      if (usernameController.text == "tes" &&
          passwordController.text == "tes") {
        // Navigator.push(
        //   context,
        //   PageTransition(
        //     duration: const Duration(milliseconds: 100),
        //     child: const MainScreen(),
        //     type: PageTransitionType.fade,
        //   ),
        // );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 1500),
            backgroundColor: kRed,
            content: Text(
              'Username atau Password kamu salah',
              style: Styles.kNunitoRegular.copyWith(color: kWhite),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: kRed,
          content: Text(
            'Username & Password diisi terlebih dahulu',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
    }
  }
}
