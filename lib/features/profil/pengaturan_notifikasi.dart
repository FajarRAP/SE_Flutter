// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants_finals.dart';


class PengaturanNotifikasi extends StatefulWidget {
  const PengaturanNotifikasi({super.key});

  @override
  State<PengaturanNotifikasi> createState() => _PengaturanNotifikasiState();
}

class _PengaturanNotifikasiState extends State<PengaturanNotifikasi> {
  bool isSwitched = false;
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
            'Pengaturan Notifkasi',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Screen.kSize20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Screen.kSize24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notifikasi Perwalian',
                              style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize16, color: kBlack),
                            ),
                            SizedBox(
                              height: Screen.kSize4,
                            ),
                            Text(
                              'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk.',
                              style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize14, color: kNeutral80),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: Screen.kSize40),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: const Color(0xFFAACFE7),
                        activeColor: kBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  const Divider()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Screen.kSize16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notifikasi Tugas Akhir',
                              style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize16, color: kBlack),
                            ),
                            SizedBox(
                              height: Screen.kSize4,
                            ),
                            Text(
                              'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk.',
                              style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize14, color: kNeutral80),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: Screen.kSize40),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: const Color(0xFFAACFE7),
                        activeColor: kBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  const Divider()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Screen.kSize16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pemberitahuan Agenda',
                              style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize16, color: kBlack),
                            ),
                            SizedBox(
                              height: Screen.kSize4,
                            ),
                            Text(
                              'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk.',
                              style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize14, color: kNeutral80),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: Screen.kSize40),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: const Color(0xFFAACFE7),
                        activeColor: kBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  const Divider()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Screen.kSize16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pengisian Kuesioner',
                              style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize16, color: kBlack),
                            ),
                            SizedBox(
                              height: Screen.kSize4,
                            ),
                            Text(
                              'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk.',
                              style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize14, color: kNeutral80),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: Screen.kSize40),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: const Color(0xFFAACFE7),
                        activeColor: kBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  const Divider()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Screen.kSize16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Riwayat Kepegawaian',
                              style: Styles.kPoppinsMedium.copyWith(
                                  fontSize: Screen.kSize16, color: kBlack),
                            ),
                            SizedBox(
                              height: Screen.kSize4,
                            ),
                            Text(
                              'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk.',
                              style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize14, color: kNeutral80),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: Screen.kSize40),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: const Color(0xFFAACFE7),
                        activeColor: kBlue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // Divider(
                  //   height: 1,
                  //   color: kGrey,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
