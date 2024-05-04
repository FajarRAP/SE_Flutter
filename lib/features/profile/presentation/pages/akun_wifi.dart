import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../widgets/text_form_field_new_password.dart';

class AkunWiFiPage extends StatefulWidget {
  const AkunWiFiPage({super.key});

  @override
  State<AkunWiFiPage> createState() => _AkunWiFiPageState();
}

class _AkunWiFiPageState extends State<AkunWiFiPage> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isObsecureNewPassword = false;
  bool isObsecureConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        elevation: 4,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(
              kBlue,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: Text(
          'Akun Wi-Fi',
          style: Styles.kPoppinsMedium.copyWith(
            color: kBlack,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
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
                color: kWhite,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Username Wi-Fi',
                          style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(':'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          '1900018416',
                          style: Styles.kPoppinsSemiBold.copyWith(
                            color: kBlack,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Berlaku Sampai',
                          style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral70,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Text(':'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          '25 September 2022',
                          style: Styles.kPoppinsSemiBold.copyWith(
                            color: kBlack,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Perbarui password',
              style: Styles.kPoppinsSemiBold.copyWith(
                color: kBlack,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            TextFormFieldNewPassword(
              isObsecure: isObsecureNewPassword,
              controller: newPasswordController,
              label: 'Password Baru',
              onTap: () => setState(
                  () => isObsecureNewPassword = !isObsecureNewPassword),
            ),
            const SizedBox(height: 16),
            TextFormFieldNewPassword(
              isObsecure: isObsecureConfirmPassword,
              controller: confirmPasswordController,
              label: 'Konfirmasi Password',
              onTap: () => setState(
                  () => isObsecureConfirmPassword = !isObsecureConfirmPassword),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => buatPasswordBaru(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: newPasswordController.text.isNotEmpty &&
                          confirmPasswordController.text.isNotEmpty
                      ? const Color(0xFF2B86C4)
                      : kNeutral70,
                  fixedSize: const Size.fromHeight(48),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Ganti password',
                  style: Styles.kPoppinsMedium.copyWith(
                    color: kWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void buatPasswordBaru() async {
    if (newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: kRed,
          content: Text(
            'Berhasil Ganti Password Wi-Fi',
            style: Styles.kNunitoRegular.copyWith(color: kWhite),
          ),
        ),
      );
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
      //         style: kNunitoRegular.copyWith(color: kWhite),
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
            'Pastikan Anda Mengisi Semua Data',
            style: Styles.kNunitoRegular.copyWith(
              color: kWhite,
            ),
          ),
        ),
      );
    }
  }
}
