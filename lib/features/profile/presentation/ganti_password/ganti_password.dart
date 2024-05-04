import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants_finals.dart';
import 'verifikasi_OTP_password.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({super.key});

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

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
            'Ganti password',
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
              'Ganti password?',
              style:
                  Styles.kPoppinsSemiBold.copyWith(fontSize: 28, color: kBlack),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Silakan masukkan alamat email yang',
              style: Styles.kNunitoRegular
                  .copyWith(fontSize: 16, color: kNeutral70),
            ),
            Text(
              'tertaut pada akun Anda',
              style: Styles.kNunitoRegular
                  .copyWith(fontSize: 16, color: kNeutral70),
            ),
            SizedBox(
              height: 32,
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
                      fontSize: 16),
                  labelText: 'Masukan email',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 20,
                    bottom: 20,
                  ),
                  labelStyle: Styles.kNunitoRegular
                      .copyWith(color: kNeutral70, fontSize: 16),
                  filled: true,
                  fillColor: const Color(0xFFF6F7F9),
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
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Validasi berhasil, lakukan sesuatu dengan alamat email.
                  print('Email: ${emailController.text}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerifikasiOTPPassword(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: emailController.text.isNotEmpty
                    ? const Color(0xFF2B86C4)
                    : kNeutral70,
                fixedSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Lanjut',
                style: Styles.kPoppinsMedium.copyWith(fontSize: 16),
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
