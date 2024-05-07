import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants_finals.dart';
import '../pages/profile.dart';

class PasswordBaru extends StatefulWidget {
  const PasswordBaru({super.key});

  @override
  State<PasswordBaru> createState() => _PasswordBaruState();
}

class _PasswordBaruState extends State<PasswordBaru> {
  var usernameController = TextEditingController();

  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var passwordKonfirmasiController = TextEditingController();
  bool isLockPasswordLama = false;
  bool isLockPasswordBaru = false;
  bool isLockPasswordKonfirmasi = false;

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
            style: Styles.kPoppinsMedium.copyWith(
              fontSize: 16,
              color: kBlack,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                'Buat password baru',
                style: Styles.kPoppinsSemiBold
                    .copyWith(fontSize: 28, color: kBlack),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Kata sandi Anda harus unik dari yang',
                style: Styles.kNunitoRegular
                    .copyWith(fontSize: 16, color: kNeutral70),
              ),
              Text(
                'digunakan sebelumnya',
                style: Styles.kNunitoRegular
                    .copyWith(fontSize: 16, color: kNeutral70),
              ),
              SizedBox(
                height: 32,
              ),
              TextFormField(
                obscureText: isLockPasswordLama,
                controller: passwordLamaController,
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                      // backgroundColor: kLightGrey,
                      color: kGrey,
                      fontSize: 16),
                  labelText: 'Password lama',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 20,
                    bottom: 20,
                  ),
                  labelStyle: Styles.kNunitoRegular
                      .copyWith(color: kNeutral70, fontSize: 16),
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
              SizedBox(
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
                      fontSize: 16),
                  labelText: 'Password Baru',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 20,
                    bottom: 20,
                  ),
                  labelStyle: Styles.kNunitoRegular
                      .copyWith(color: kNeutral70, fontSize: 16),
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
                height: 16,
              ),
              TextFormField(
                obscureText: isLockPasswordKonfirmasi,
                controller: passwordKonfirmasiController,
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelStyle: Styles.kNunitoRegular.copyWith(
                      // backgroundColor: kLightGrey,
                      color: kGrey,
                      fontSize: 16),
                  labelText: 'Konfirmasi Password',
                  contentPadding: EdgeInsets.only(
                    left: 16,
                    top: 20,
                    bottom: 20,
                  ),
                  labelStyle: Styles.kNunitoRegular
                      .copyWith(color: kNeutral70, fontSize: 16),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
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
                height: 16,
              ),
              SizedBox(
                height: 40,
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
                    fixedSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text(
                  'Ganti password',
                  style: Styles.kPoppinsMedium.copyWith(fontSize: 16),
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
      if (passwordBaruController.text == "agung123" &&
          passwordKonfirmasiController.text == "agung123") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profil()));
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
