// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';
import 'verifikasi_OTP.dart';



class LupaPassword extends StatefulWidget {
  const LupaPassword({super.key});

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Screen.kSize32,
            ),
            Text(
              'Lupa password?',
              style:
                  Styles.kPoppinsSemiBold.copyWith(fontSize: Screen.kSize28, color: kBlack),
            ),
            SizedBox(
              height: Screen.kSize8,
            ),
            Text(
              'Jangan khawatir! Ini terjadi. Silakan masukkan',
              style:
                  Styles.kNunitoRegular.copyWith(fontSize: Screen.kSize16, color: kNeutral70),
            ),
            Text(
              'alamat email yang tertaut dengan akun Anda',
              style:
                  Styles.kNunitoRegular.copyWith(fontSize: Screen.kSize16, color: kNeutral70),
            ),
            SizedBox(
              height: Screen.kSize32,
            ),
            Form(
              key: formKey,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                      // backgroundColor: kLightGrey,
                      color: kGrey,
                      fontSize: Screen.kSize16),
                  labelText: 'Masukan email',
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
                    borderRadius:
                        BorderRadius.circular(10.0), // Menentukan border radius
                    borderSide: const BorderSide(
                      color: kBlue,
                    ), // Menghilangkan sisi border
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Menentukan border radius
                    borderSide: const BorderSide(
                      color: kRed,
                    ), // Menghilangkan sisi border
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Menentukan border radius
                    borderSide: const BorderSide(
                      color: kRed,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan alamat email';
                  } else if (!isValidUADEmail(value)) {
                    return 'Alamat email harus berakhir dengan @webmail.uad.ac.id';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 100),
                      child: const VerifikasiOTP(),
                      type: PageTransitionType.fade,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: emailController.text.isNotEmpty
                    ? const Color(0xFF2B86C4)
                    : kNeutral70,
                fixedSize: Size(Screen.width, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Lanjut',
                style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool isValidUADEmail(String value) {
    // Validasi apakah alamat email berakhir dengan @webmail.uad.ac.id.
    return value.endsWith('@webmail.uad.ac.id');
  }
}
