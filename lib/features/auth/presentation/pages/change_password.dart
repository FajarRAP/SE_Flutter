import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../widgets/appbar_lupa_password.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/text_field_password.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({super.key});

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  final usernameController = TextEditingController();
  final passwordLamaController = TextEditingController();
  final passwordBaruController = TextEditingController();
  final passwordKonfirmasiController = TextEditingController();
  bool isLockPasswordLama = false;
  bool isLockPasswordBaru = false;
  bool isLockPasswordKonfirmasi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLupaPassword(),
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buat password baru',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kBlack,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Kata sandi Anda harus unik dari yang digunakan sebelumnya',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              TextFieldPassword(
                isObsecure: isLockPasswordLama,
                labelText: 'Password Lama',
                controller: passwordLamaController,
                onTap: () =>
                    setState(() => isLockPasswordLama = !isLockPasswordLama),
              ),
              const SizedBox(height: 16),
              TextFieldPassword(
                isObsecure: isLockPasswordBaru,
                labelText: 'Password Baru',
                controller: passwordBaruController,
                onTap: () =>
                    setState(() => isLockPasswordBaru = !isLockPasswordBaru),
              ),
              const SizedBox(height: 16),
              TextFieldPassword(
                isObsecure: isLockPasswordKonfirmasi,
                labelText: 'Konfirmasi Password',
                controller: passwordKonfirmasiController,
                onTap: () => setState(
                    () => isLockPasswordKonfirmasi = !isLockPasswordKonfirmasi),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                isFilled: isFilled,
                text: 'Ganti Password',
                onPressed: buatPasswordBaru,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    passwordKonfirmasiController.dispose();
    super.dispose();
  }

  bool get isFilled =>
      passwordLamaController.text.isNotEmpty &&
      passwordBaruController.text.isNotEmpty &&
      passwordKonfirmasiController.text.isNotEmpty;

  bool get isAuthenticated =>
      passwordBaruController.text == passwordKonfirmasiController.text;

  void buatPasswordBaru() async {
    if (!isFilled) {
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
      return;
    }

    if (!isAuthenticated) {
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
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        backgroundColor: kGreen,
        content: Text(
          'Password berhasil diganti',
          style: Styles.kNunitoRegular.copyWith(color: kWhite),
        ),
      ),
    );

    Navigator.pushReplacementNamed(context, loginRoute);
  }
}
