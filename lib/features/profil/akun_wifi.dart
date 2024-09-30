// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants_finals.dart';



class AkunWifi extends StatefulWidget {
  AkunWifi({super.key});

  @override
  State<AkunWifi> createState() => _AkunWifiState();
}

class _AkunWifiState extends State<AkunWifi> {
  var passwordLamaController = TextEditingController();

  var passwordBaruController = TextEditingController();

  bool isLockPasswordLama = false;

  bool isLockPasswordBaru = false;

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F9),
      appBar: AppBar(
        elevation: 4,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            color: kBlue,
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
        ),
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Akun WI-FI',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Screen.kSize32,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(Screen.kSize24, Screen.kSize20, Screen.kSize24, Screen.kSize20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Screen.kSize20),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x087281df),
                    blurRadius: 4.11,
                    offset: Offset(0, 0.52),
                  ),
                  BoxShadow(
                    color: Color(0x0c7281df),
                    blurRadius: 6.99,
                    offset: Offset(0, 1.78),
                  ),
                  BoxShadow(
                    color: Color(0x0f7281df),
                    blurRadius: 10.20,
                    offset: Offset(0, 4.11),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username WI-FI   :',
                        style: Styles.kNunitoRegular.copyWith(
                          fontSize: Screen.kSize16,
                          color: kNeutral70,
                        ),
                      ),
                      SizedBox(
                        width: Screen.kSize12,
                      ),
                      Expanded(
                        child: Text(
                          '1900018416',
                          style: Styles.kPoppinsSemiBold.copyWith(
                              fontSize: Screen.kSize16, color: kBlack),
                        ),
                      )
                    ],
                  ),
                  Divider(color: kGrey.withOpacity(20/100),),
                  SizedBox(
                    height: Screen.kSize20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Berlaku Sampai    :',
                        style: Styles.kNunitoRegular.copyWith(
                          fontSize: Screen.kSize16,
                          color: kNeutral70,
                        ),
                      ),
                      SizedBox(
                        width: Screen.kSize12,
                      ),
                      Expanded(
                        child: Text(
                          '25 September 2022',
                          style: Styles.kPoppinsSemiBold.copyWith(
                              fontSize: Screen.kSize16, color: kBlack),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize40,
            ),
            Text(
              'Perbarui password',
              style:
                  Styles.kPoppinsSemiBold.copyWith(fontSize: Screen.kSize16, color: kBlack),
            ),
            SizedBox(
              height: Screen.kSize24,
            ),
            TextFormField(
              obscureText: isLockPasswordLama,
              controller: passwordLamaController,
              decoration: InputDecoration(
                isDense: true,
                floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                    // backgroundColor: kLightGrey,
                    color: kGrey,
                    fontSize: Screen.kSize16),
                labelText: 'Password Baru',
                contentPadding: EdgeInsets.only(
                  left: Screen.kSize16,
                  top: Screen.kSize20,
                  bottom: Screen.kSize20,
                ),
                labelStyle: Styles.kNunitoRegular.copyWith(
                    color: kNeutral70, fontSize: Screen.kSize16),
                filled: true,
                fillColor: const Color(0xFFFAFAFA),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isLockPasswordLama = !isLockPasswordLama;
                    });
                  },
                  child: isLockPasswordLama
                      ? SvgPicture.asset(
                          'assets/icons/eye.svg',
                          color: kNeutral80,
                          fit: BoxFit.scaleDown,
                        )
                      : SvgPicture.asset('assets/icons/eye-slash.svg',
                          color: kNeutral80, fit: BoxFit.scaleDown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Menentukan border radius
                  borderSide: const BorderSide(
                    color: kBlue,
                  ), // Menghilangkan sisi border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Menentukan border radius
                  borderSide: const BorderSide(
                    color: Color(0xFFE8ECF4),
                  ), // Menghilangkan sisi border
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: isLockPasswordBaru,
              controller: passwordBaruController,
              decoration: InputDecoration(
                isDense: true,
                floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                    // backgroundColor: kLightGrey,
                    color: kGrey,
                    fontSize: Screen.kSize16),
                labelText: 'Konfirmasi Password',
                contentPadding: EdgeInsets.only(
                  left: Screen.kSize16,
                  top: Screen.kSize20,
                  bottom: Screen.kSize20,
                ),
                labelStyle: Styles.kNunitoRegular.copyWith(
                    color: kNeutral70, fontSize: Screen.kSize16),
                filled: true,
                fillColor: const Color(0xFFFAFAFA),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isLockPasswordBaru = !isLockPasswordBaru;
                    });
                  },
                  child: isLockPasswordBaru
                      ? SvgPicture.asset(
                          'assets/icons/eye.svg',
                          color: kNeutral80,
                          fit: BoxFit.scaleDown,
                        )
                      : SvgPicture.asset('assets/icons/eye-slash.svg',
                          color: kNeutral80, fit: BoxFit.scaleDown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Menentukan border radius
                  borderSide: const BorderSide(
                    color: kBlue,
                  ), // Menghilangkan sisi border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Menentukan border radius
                  borderSide: const BorderSide(
                    color: Color(0xFFE8ECF4),
                  ), // Menghilangkan sisi border
                ),
              ),
            ),
            SizedBox(
              height: Screen.kSize32,
            ),
            ElevatedButton(
              onPressed: () {
                buatPasswordBaru();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: passwordLamaController.text.isNotEmpty &&
                          passwordBaruController.text.isNotEmpty
                      ? const Color(0xFF2B86C4)
                      : kNeutral70,
                  fixedSize: Size(Screen.width, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                'Ganti password',
                style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16),
              ),
            )
          ],
        ),
      ),
    );
  }

  void buatPasswordBaru() async {
    if (passwordLamaController.text.isNotEmpty &&
        passwordBaruController.text.isNotEmpty) {
      // if (passwordLamaController.text == "agung123" &&
      //     passwordBaruController.text == "agung123") {
      //   Navigator.push(
      //     context,
      //     PageTransition(
      //       duration: const Duration(milliseconds: 100),
      //       child: Container(),
      //       type: PageTransitionType.fade,
      //     ),
      //   );
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       duration: const Duration(milliseconds: 1500),
      //       backgroundColor: kRed,
      //       content: Text(
      //         'Password baru dan konfirmasi tidak sesuai',
      //         style: Styles.kNunitoRegular.copyWith(color: kWhite),
      //       ),
      //     ),
      //   );
      // }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: kRed,
          content: Text(
            'Pastikan Anda mengisi semua data',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
    }
  }
}
