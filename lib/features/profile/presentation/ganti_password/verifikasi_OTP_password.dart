import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import 'ganti_password_baru.dart';

class VerifikasiOTPPassword extends StatefulWidget {
  const VerifikasiOTPPassword({super.key});

  @override
  State<VerifikasiOTPPassword> createState() => _VerifikasiOTPPasswordState();
}

class _VerifikasiOTPPasswordState extends State<VerifikasiOTPPassword> {
  var no1OTPController = TextEditingController();

  var no2OTPController = TextEditingController();

  var no3OTPController = TextEditingController();

  var no4OTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            style: Styles.kPoppinsMedium.copyWith(fontSize: 16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              'Verifikasi OTP',
              style:
                  Styles.kPoppinsSemiBold.copyWith(fontSize: 28, color: kBlack),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Masukan kode verifikasi yang baru saja kami',
              style:
                  Styles.kNunitoRegular.copyWith(fontSize: 16, color: kNeutral70),
            ),
            Text(
              'kirimkan ke alamat webmail Anda',
              style:
                  Styles.kNunitoRegular.copyWith(fontSize: 16, color: kNeutral70),
            ),
            SizedBox(
              height: 32,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      // height: SizeConfig.blockSizeHorizontal! * 15.9,
                      // width: SizeConfig.blockSizeHorizontal! * 18.7,
                      child: TextFormField(
                        controller: no1OTPController,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF6F7F9),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                                color: kBlue,
                                width: 1.5), // Menghilangkan sisi border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                              color: Color(0xFFE8ECF4),
                            ), // Menghilangkan sisi border
                          ),
                        ),
                        style: Styles.kPoppinsSemiBold.copyWith(
                            fontSize: 24, color: kBlack),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      // height: SizeConfig.blockSizeHorizontal! * 15.9,
                      // width: SizeConfig.blockSizeHorizontal! * 18.7,
                      child: TextFormField(
                        controller: no2OTPController,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF6F7F9),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                                color: kBlue,
                                width: 1.5), // Menghilangkan sisi border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                              color: Color(0xFFE8ECF4),
                            ), // Menghilangkan sisi border
                          ),
                        ),
                        style: Styles.kPoppinsSemiBold.copyWith(
                            fontSize: 24, color: kBlack),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      // height: SizeConfig.blockSizeHorizontal! * 15.9,
                      // width: SizeConfig.blockSizeHorizontal! * 18.7,
                      child: TextFormField(
                        controller: no3OTPController,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF6F7F9),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                                color: kBlue,
                                width: 1.5), // Menghilangkan sisi border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                              color: Color(0xFFE8ECF4),
                            ), // Menghilangkan sisi border
                          ),
                        ),
                        style: Styles.kPoppinsSemiBold.copyWith(
                            fontSize: 24, color: kBlack),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      // height: SizeConfig.blockSizeHorizontal! * 15.9,
                      // width: SizeConfig.blockSizeHorizontal! * 18.7,
                      child: TextFormField(
                        controller: no4OTPController,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF6F7F9),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                                color: kBlue,
                                width: 1.5), // Menghilangkan sisi border
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Menentukan border radius
                            borderSide: const BorderSide(
                              color: Color(0xFFE8ECF4),
                            ), // Menghilangkan sisi border
                          ),
                        ),
                        style: Styles.kPoppinsSemiBold.copyWith(
                            fontSize: 24, color: kBlack),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum mendapatkan OTP? ',
                  style: Styles.kNunitoRegular.copyWith(
                      fontSize: 16, color: kNeutral70),
                ),
                Text(
                  'Kirim ulang',
                  style: Styles.kNunitoBold.copyWith(fontSize: 16, color: kBlue),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                verifikasi();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: no1OTPController.text.isNotEmpty &&
                          no2OTPController.text.isNotEmpty &&
                          no3OTPController.text.isNotEmpty &&
                          no4OTPController.text.isNotEmpty
                      ? const Color(0xFF2B86C4)
                      : kNeutral70,
                  fixedSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                'Verifikasi',
                style: Styles.kPoppinsMedium.copyWith(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  void verifikasi() async {
    if (no1OTPController.text.isNotEmpty &&
        no2OTPController.text.isNotEmpty &&
        no3OTPController.text.isNotEmpty &&
        no4OTPController.text.isNotEmpty) {
      if (no1OTPController.text == '1' &&
          no2OTPController.text == '2' &&
          no3OTPController.text == '3' &&
          no4OTPController.text == '4') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasswordBaru(),)
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 1500),
            backgroundColor: kRed,
            content: Text(
              'Kode verifikasi Anda salah',
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
            'Kode verifikasi diisi terlebih dahulu',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
    }
  }
}
