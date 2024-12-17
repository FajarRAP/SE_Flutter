import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../widgets/photo_profile.dart';
import '../widgets/text_form_field_informasi_pribadi.dart';

class InformasiPribadiPage extends StatefulWidget {
  const InformasiPribadiPage({super.key});

  @override
  State<InformasiPribadiPage> createState() => _InformasiPribadiPageState();
}

class _InformasiPribadiPageState extends State<InformasiPribadiPage> {
  final TextEditingController namaController =
      TextEditingController(text: 'Agung Nurul Huda');

  final TextEditingController emailController =
      TextEditingController(text: 'agung1900018416@webmail.uad.ac.id');

  final TextEditingController noHpController =
      TextEditingController(text: '089522792400');

  final formKeyNama = GlobalKey<FormState>();
  final formKeyEmail = GlobalKey<FormState>();
  final formKeyNoHp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
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
        title: SizedBox(
          child: Text(
            'Informasi Pribadi',
            style: Styles.kPoppinsMedium.copyWith(
              color: kBlack,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poto Profil
              const PhotoProfile(),

              const SizedBox(height: 32),

              // Nama Lengkap
              TextFormFieldInformasiPribadi(
                formKey: formKeyNama,
                controller: namaController,
                title: 'Nama Lengkap',
                hintText: 'Contoh : Fajar Riansyah Aryda Putra',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Harus Diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Email
              TextFormFieldInformasiPribadi(
                formKey: formKeyEmail,
                controller: emailController,
                title: 'Alamat Email',
                hintText: 'Contoh : fajar2100018165@webmail.uad.ac.id',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Alamat Email Harus Diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Nomor Handphone
              TextFormFieldInformasiPribadi(
                formKey: formKeyNoHp,
                controller: noHpController,
                title: 'Nomor Handphone',
                hintText: 'Contoh : 085316979xxx',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nomor Handphone Harus Diisi';
                  } else if (value.length < 8 || value.length > 15) {
                    return 'Nomor Handphone Harus 8-15 Digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Button Simpan
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKeyNama.currentState!.validate()) {}
                    if (formKeyEmail.currentState!.validate()) {}
                    if (formKeyNoHp.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: namaController.text == '' ||
                            emailController.text == '' ||
                            noHpController.text == ''
                        ? kNeutral70
                        : kBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Simpan Perubahan',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    noHpController.dispose();
    super.dispose();
  }
}
