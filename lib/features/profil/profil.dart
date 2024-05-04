import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konsumsi_api_agenda/features/profil/akun_wifi.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';
import 'ganti_password/ganti_password.dart';
import 'informasi-pribadi.dart';
import 'informasi_gaji.dart';
import 'pengaturan_notifikasi.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Profil',
            style: Styles.kPoppinsMedium
                .copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Screen.kSize32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/home-profil.png',
                    width: Screen.blockSizeHorizontal * 15,
                  ),
                  SizedBox(
                    width: Screen.kSize12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Agung Nurul Huda',
                            style: Styles.kPoppinsSemiBold.copyWith(
                                fontSize: Screen.kSize20, color: kBlack),
                          ),
                        ],
                      ),
                      Text(
                        'Lektor Kepala',
                        style: Styles.kNunitoRegular
                            .copyWith(fontSize: Screen.kSize18, color: kBlue),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/profil-NIPM.svg'),
                  SizedBox(
                    width: Screen.kSize16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NIPM',
                          style: Styles.kPoppinsRegular.copyWith(
                              fontSize: Screen.kSize14, color: kNeutral80),
                        ),
                        Text(
                          '19730710 200409 111 0951298',
                          style: Styles.kNunitoSemiBold.copyWith(
                              fontSize: Screen.kSize16, color: kBlack),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/profil-NIDN.svg'),
                  SizedBox(
                    width: Screen.kSize16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Unit kerja',
                          style: Styles.kPoppinsRegular.copyWith(
                              fontSize: Screen.kSize14, color: kNeutral80),
                        ),
                        Text(
                          'FTI - laboran riset sistem cerdas dan rekayasa perangkat lunak dan data',
                          style: Styles.kNunitoSemiBold.copyWith(
                              fontSize: Screen.kSize16, color: kBlack),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize32,
            ),
            Container(
              height: 8,
              color: const Color(0xFFF6F7F9),
            ),
            SizedBox(
              height: Screen.kSize32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Akun saya',
                    style: Styles.kPoppinsSemiBold
                        .copyWith(fontSize: Screen.kSize16, color: kBlack),
                  ),
                  SizedBox(
                    height: Screen.kSize20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 100),
                          child: InformasiPribadi(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/informasi-pribadi.svg'),
                            SizedBox(
                              width: Screen.kSize16,
                            ),
                            Expanded(
                              child: Text(
                                'Informasi pribadi',
                                style: Styles.kNunitoRegular.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arrow-right.svg')
                          ],
                        ),
                        SizedBox(
                          height: Screen.kSize12,
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 100),
                              child: const GantiPassword(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/ganti-password.svg'),
                            SizedBox(
                              width: Screen.kSize16,
                            ),
                            Expanded(
                              child: Text(
                                'Ganti password',
                                style: Styles.kNunitoRegular.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arrow-right.svg')
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Screen.kSize12,
                      ),
                      const Divider()
                    ],
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 100),
                          child: AkunWifi(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/akun-wifi.svg'),
                            SizedBox(
                              width: Screen.kSize16,
                            ),
                            Expanded(
                              child: Text(
                                'Akun wi-fi',
                                style: Styles.kNunitoRegular.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arrow-right.svg')
                          ],
                        ),
                        SizedBox(
                          height: Screen.kSize12,
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Text(
                    'Gaji saya',
                    style: Styles.kPoppinsSemiBold
                        .copyWith(fontSize: Screen.kSize16, color: kBlack),
                  ),
                  SizedBox(
                    height: Screen.kSize20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 100),
                          child: InformasiGaji(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/informasi-gaji.svg'),
                            SizedBox(
                              width: Screen.kSize16,
                            ),
                            Expanded(
                              child: Text(
                                'Informasi gaji',
                                style: Styles.kNunitoRegular.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arrow-right.svg')
                          ],
                        ),
                        SizedBox(
                          height: Screen.kSize12,
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Text(
                    'Notifikasi',
                    style: Styles.kPoppinsSemiBold
                        .copyWith(fontSize: Screen.kSize16, color: kBlack),
                  ),
                  SizedBox(
                    height: Screen.kSize20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          duration: const Duration(milliseconds: 100),
                          child: PengaturanNotifikasi(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/pengaturan-notifikasi.svg'),
                            SizedBox(
                              width: Screen.kSize16,
                            ),
                            Expanded(
                              child: Text(
                                'Pengaturan notifikasi',
                                style: Styles.kNunitoRegular.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arrow-right.svg')
                          ],
                        ),
                        SizedBox(
                          height: Screen.kSize20,
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Text(
                    'Keluar',
                    style: Styles.kPoppinsSemiBold
                        .copyWith(fontSize: Screen.kSize16, color: kBlack),
                  ),
                  SizedBox(
                    height: Screen.kSize12,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(28))),
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: Screen.height * .35,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Screen.kSize20),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Screen.kSize10,
                                  ),
                                  Container(
                                    width: Screen.kSize40,
                                    height: Screen.kSize4,
                                    color: kNeutral40,
                                  ),
                                  SizedBox(
                                    height: Screen.kSize28,
                                  ),
                                  Text(
                                    'Yakin Keluar?',
                                    style: Styles.kPoppinsSemiBold.copyWith(
                                        fontSize: Screen.kSize24,
                                        color: kBlack),
                                  ),
                                  SizedBox(
                                    height: Screen.kSize20,
                                  ),
                                  const Divider(),
                                  SizedBox(
                                    height: Screen.kSize20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.popUntil(
                                          context, (route) => route.isFirst);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: kRed,
                                        fixedSize: Size(Screen.width, 48),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    child: Text(
                                      'Ya, Keluar',
                                      style: Styles.kPoppinsRegular
                                          .copyWith(fontSize: Screen.kSize16),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Screen.kSize16,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: OutlinedButton.styleFrom(
                                        fixedSize: Size(Screen.width, 48),
                                        side: const BorderSide(
                                          color: kBlue,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    child: Text(
                                      'Batal',
                                      style: Styles.kPoppinsRegular.copyWith(
                                          fontSize: Screen.kSize16,
                                          color: kBlue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/keluar.svg'),
                            SizedBox(
                              width: Screen.kSize16,
                            ),
                            Expanded(
                              child: Text(
                                'Keluar Sekarang',
                                style: Styles.kNunitoRegular.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              ),
                            ),
                            SvgPicture.asset('assets/icons/arrow-right.svg')
                          ],
                        ),
                        SizedBox(
                          height: Screen.kSize12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize40,
            )
          ],
        ),
      ),
    );
  }
}
