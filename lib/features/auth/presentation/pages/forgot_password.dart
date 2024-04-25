import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../widgets/appbar_lupa_password.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/text_field_custom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: const AppBarLupaPassword(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Lupa password?',
                style: Styles.kPoppinsSemiBold.copyWith(
                  fontSize: 28,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Jangan khawatir! Ini terjadi. Silakan masukkan alamat email yang tertaut dengan akun Anda',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: formKey,
                child: TextFieldCustom(
                  controller: emailController,
                  labelText: 'Masukkan Email',
                  // validator: formValidation,
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                isFilled: emailController.text.isNotEmpty,
                text: 'Lanjut',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, otpVerificationRoute);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  bool isValidUADEmail(final String value) =>
      value.endsWith('@webmail.uad.ac.id');

  String? formValidation(final String? value) {
    if (value == null || value.trim() == '' || value.isEmpty) {
      return 'Alamat Email Tidak Boleh Kosong';
    }
    if (!isValidUADEmail(value)) {
      return 'Mohon Gunakan Alamat Email UAD';
    }
    return null;
  }
}
