// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';
import '../../main_screen.dart';


class GantiPasswordBaru extends StatefulWidget {
  const GantiPasswordBaru({super.key});

  @override
  State<GantiPasswordBaru> createState() => _GantiPasswordBaruState();
}

class _GantiPasswordBaruState extends State<GantiPasswordBaru> {
  var usernameController = TextEditingController();

  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var passwordKonfirmasiController = TextEditingController();
  bool isLockPasswordLama = false;
  bool isLockPasswordBaru = false;
  bool isLockPasswordKonfirmasi = false;

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
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
        title: SizedBox(
          child: Text(
            'Lupa password',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Screen.kSize32,
              ),
              Text(
                'Buat password baru',
                style:
                    Styles.kPoppinsSemiBold.copyWith(fontSize: Screen.kSize28, color: kBlack),
              ),
              SizedBox(
                height: Screen.kSize8,
              ),
              Text(
                'Kata sandi Anda harus unik dari yang',
                style: Styles.kNunitoRegular.copyWith(
                    fontSize: Screen.kSize16, color: kNeutral70),
              ),
              Text(
                'digunakan sebelumnya',
                style: Styles.kNunitoRegular.copyWith(
                    fontSize: Screen.kSize16, color: kNeutral70),
              ),
              SizedBox(
                height: Screen.kSize32,
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
                  labelText: 'Password lama',
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
              SizedBox(
                height: Screen.kSize16,
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
                  labelText: 'Password Baru',
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
                height: Screen.kSize16,
              ),
              TextFormField(
                obscureText: isLockPasswordKonfirmasi,
                controller: passwordKonfirmasiController,
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
                  fillColor: const Color(0xFFF8F9FB),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isLockPasswordKonfirmasi = !isLockPasswordKonfirmasi;
                      });
                    },
                    child: isLockPasswordKonfirmasi
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
                height: Screen.kSize16,
              ),
              SizedBox(
                height: Screen.kSize40,
              ),
              ElevatedButton(
                onPressed: () {
                  buatPasswordBaru();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: passwordLamaController.text.isNotEmpty &&
                            passwordBaruController.text.isNotEmpty &&
                            passwordKonfirmasiController.text.isNotEmpty
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
      ),
    );
  }

  void buatPasswordBaru() async {
    if (passwordLamaController.text.isNotEmpty &&
        passwordBaruController.text.isNotEmpty &&
        passwordKonfirmasiController.text.isNotEmpty) {
      if (passwordBaruController.text == passwordKonfirmasiController.text) {
        Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 100),
            child: const MainScreen(),
            type: PageTransitionType.fade,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 1500),
            backgroundColor: kRed,
            content: Text(
              'Password baru dan konfirmasi tidak sesuai',
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
            'Pastikan Anda mengisi semua data',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
    }
  }
}
