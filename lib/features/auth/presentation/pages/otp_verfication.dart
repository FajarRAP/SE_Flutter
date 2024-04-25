import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../widgets/appbar_lupa_password.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/text_field_otp.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final no1OTPController = TextEditingController();
  final no2OTPController = TextEditingController();
  final no3OTPController = TextEditingController();
  final no4OTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLupaPassword(),
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verifikasi OTP',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kBlack,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Masukan kode verifikasi yang baru saja kami',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral70,
                  fontSize: 16,
                ),
              ),
              Text(
                'kirimkan ke alamat webmail Anda',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: TextFieldOTP(controller: no1OTPController),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: TextFieldOTP(controller: no2OTPController),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: TextFieldOTP(controller: no3OTPController),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 65,
                      child: TextFieldOTP(controller: no4OTPController),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum mendapatkan OTP? ',
                    style: Styles.kNunitoRegular.copyWith(
                      color: kNeutral70,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Kirim ulang',
                    style: Styles.kNunitoBold.copyWith(
                      color: kBlue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                isFilled: isFilled,
                text: 'Verifikasi',
                onPressed: verifikasi,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    no1OTPController.dispose();
    no2OTPController.dispose();
    no3OTPController.dispose();
    no4OTPController.dispose();
    super.dispose();
  }

  bool get isFilled =>
      no1OTPController.text.isNotEmpty &&
      no2OTPController.text.isNotEmpty &&
      no3OTPController.text.isNotEmpty &&
      no4OTPController.text.isNotEmpty;

  bool get isAuthenticated =>
      no1OTPController.text == '1' &&
      no2OTPController.text == '2' &&
      no3OTPController.text == '3' &&
      no4OTPController.text == '4';

  void verifikasi() async {
    if (!isFilled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: kRed,
          content: Text(
            'Isi Kode Verifikasi Terlebih Dahulu',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
      return;
    }
    if (!isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: kRed,
          content: Text(
            'Kode Verifikasi Anda Salah',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
      return;
    }
    Navigator.pushNamed(context, changeNewPasswordRoute);
  }
}
