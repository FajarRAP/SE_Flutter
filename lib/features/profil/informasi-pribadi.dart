// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants_finals.dart';


class InformasiPribadi extends StatefulWidget {
  InformasiPribadi({super.key});

  @override
  State<InformasiPribadi> createState() => _InformasiPribadiState();
}

class _InformasiPribadiState extends State<InformasiPribadi> {
  TextEditingController namaLengkap =
      TextEditingController(text: 'Agung Nurul Huda');

  TextEditingController alamatEmail =
      TextEditingController(text: 'agung1900018416@webmail.uad.ac.id');

  TextEditingController noHP = TextEditingController(text: '089522792400');
  var formKeyNama = GlobalKey<FormState>();
  var formKeyEmail = GlobalKey<FormState>();
  var formKeyNoHP = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 4,
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
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Informasi Pribadi',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Screen.kSize32,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(children: [
                  Image.asset(
                    'assets/images/home-profil.png',
                    width: Screen.width * .22,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 16, 0, 64),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(24),
                                            topRight: Radius.circular(24))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 32),
                                          height: 6,
                                          width: 88,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFD4D5D7),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/galery.svg',
                                                  width: Screen.kSize32,
                                                ),
                                                SizedBox(
                                                  width: Screen.kSize8,
                                                ),
                                                Text(
                                                  'Galery',
                                                  style:
                                                      Styles.kNunitoSemiBold.copyWith(
                                                          fontSize: Screen.kSize16,
                                                          color: kBlack),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: Screen.kSize40,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/camera.svg',
                                                  width: Screen.kSize32,
                                                ),
                                                SizedBox(
                                                  width: Screen.kSize8,
                                                ),
                                                Text(
                                                  'Camera',
                                                  style:
                                                      Styles.kNunitoSemiBold.copyWith(
                                                          fontSize: Screen.kSize16,
                                                          color: kBlack),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: CircleAvatar(
                              backgroundColor: const Color(0xFF006EB8),
                              foregroundColor: Colors.white,
                              radius: Screen.kSize16,
                              child: Icon(
                                Icons.add_a_photo,
                                size: Screen.kSize18,
                              )),
                        ),
                      ))
                ]),
              ),
              SizedBox(
                height: Screen.kSize32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Nama Lengkap',
                        style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14, color: kNeutral70),
                      ),
                      SizedBox(
                        width: Screen.kSize4,
                      ),
                      Text(
                        '*',
                        style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14, color: kRed),
                      ),
                    ],
                  ),
                  Form(
                    key: formKeyNama,
                    child: TextFormField(
                      controller: namaLengkap,
                      style: Styles.kPoppinsRegular.copyWith(
                          fontSize: Screen.kSize16, color: kBlack),
                      decoration: InputDecoration(
                        // errorText: errorNoHp,
                        errorStyle: Styles.kPoppinsRegular.copyWith(
                            fontSize: Screen.kSize14, color: kRed),
                        border: const UnderlineInputBorder(),
                        labelText: null,
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E8E9)),
                        ),
                        hintText: 'Cth: Agung NH',
                        hintStyle: Styles.kPoppinsRegular.copyWith(
                            fontSize: Screen.kSize16, color: kNeutral70),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kBlue),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E8E9)),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          // Menentukan border radius
                          borderSide: BorderSide(
                            color: kRed,
                          ), // Menghilangkan sisi border
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Screen.kSize24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Alamat Email',
                        style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14, color: kNeutral70),
                      ),
                      SizedBox(
                        width: Screen.kSize4,
                      ),
                      Text(
                        '*',
                        style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14, color: kRed),
                      ),
                    ],
                  ),
                  Form(
                    key: formKeyEmail,
                    child: TextFormField(
                      controller: alamatEmail,
                      style: Styles.kPoppinsRegular.copyWith(
                          fontSize: Screen.kSize16, color: kBlack),
                      decoration: InputDecoration(
                        // errorText: errorNoHp,
                        errorStyle: Styles.kPoppinsRegular.copyWith(
                            fontSize: Screen.kSize14, color: kRed),
                        border: const UnderlineInputBorder(),
                        labelText: null,
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E8E9)),
                        ),
                        hintText: 'Cth: nama@email.com',
                        hintStyle: Styles.kPoppinsRegular.copyWith(
                            fontSize: Screen.kSize16, color: kNeutral70),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kBlue),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E8E9)),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          // Menentukan border radius
                          borderSide: BorderSide(
                            color: kRed,
                          ), // Menghilangkan sisi border
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mohon masukan email yang valid';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Screen.kSize24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Nomor Ponsel',
                        style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14, color: kNeutral70),
                      ),
                      SizedBox(
                        width: Screen.kSize4,
                      ),
                      Text(
                        '*',
                        style: Styles.kNunitoRegular.copyWith(
                            fontSize: Screen.kSize14, color: kRed),
                      ),
                    ],
                  ),
                  Form(
                    key: formKeyNoHP,
                    child: TextFormField(
                      controller: noHP,
                      keyboardType: TextInputType.number,
                      style: Styles.kPoppinsRegular.copyWith(
                          fontSize: Screen.kSize16, color: kBlack),
                      decoration: InputDecoration(
                        // errorText: errorNoHp,
                        errorStyle: Styles.kPoppinsRegular.copyWith(
                            fontSize: Screen.kSize14, color: kRed),
                        border: const UnderlineInputBorder(),
                        labelText: null,
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E8E9)),
                        ),
                        hintText: '081xxxxxxxxx',
                        hintStyle: Styles.kPoppinsRegular.copyWith(
                            fontSize: Screen.kSize16, color: kNeutral70),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kBlue),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E8E9)),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          // Menentukan border radius
                          borderSide: BorderSide(
                            color: kRed,
                          ), // Menghilangkan sisi border
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Mohon masukan no. HP yang valid';
                        } else if (value.length < 8 || value.length > 15) {
                          return 'no HP harus 8-15 angka';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Screen.kSize32,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKeyNama.currentState!.validate()) {}
                    if (formKeyEmail.currentState!.validate()) {}
                    if (formKeyNoHP.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: namaLengkap.text == '' ||
                            alamatEmail.text == '' ||
                            noHP.text == ''
                        ? kNeutral70
                        : kBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          24.0), // Mengatur border radius di sini
                    ),
                  ),
                  child: Text(
                    'Simpan Perubahan',
                    style: Styles.kPoppinsMedium.copyWith(fontSize: 14, color: kWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
