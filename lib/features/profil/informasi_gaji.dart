// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';
import '../gaji/presentation/pages/detail_gaji.dart';



class InformasiGaji extends StatefulWidget {
  InformasiGaji({super.key});

  @override
  State<InformasiGaji> createState() => _InformasiGajiState();
}

class _InformasiGajiState extends State<InformasiGaji> {
  bool showAll = false;

  List gaji = [
    ['3.500.000', 'Desember 2023'],
    ['3.500.000', 'November 2023'],
    ['3.500.000', 'Oktober 2023'],
    ['3.500.000', 'September 2023'],
    ['3.500.000', 'Agustus 2023'],
    ['3.500.000', 'Juli 2023'],
    ['3.500.000', 'Juni 2023'],
    ['3.500.000', 'Mei 2023'],
    ['3.500.000', 'April 2023'],
    ['3.500.000', 'Maret 2023'],
    ['3.500.000', 'Februari 2023'],
    ['3.500.000', 'Januari 2023'],
  ];

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F9),
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
            'Informasi Gaji',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Screen.kSize32,
            ),
            Column(
              children: showAll
                  ? gaji.map(
                      (e) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      duration:
                                          const Duration(milliseconds: 100),
                                      child: DetailGajiPage(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Screen.kSize16, vertical: Screen.kSize16),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x087281DF),
                                        blurRadius: 4.11,
                                        offset: Offset(0, 0.52),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0C7281DF),
                                        blurRadius: 6.99,
                                        offset: Offset(0, 1.78),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0F7281DF),
                                        blurRadius: 10.20,
                                        offset: Offset(0, 4.11),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/gaji.svg',
                                        width: Screen.kSize40,
                                      ),
                                      SizedBox(width: Screen.kSize16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rp ${e[0]}',
                                            style: Styles.kPoppinsMedium.copyWith(
                                                fontSize: Screen.kSize18,
                                                color: kBlack),
                                          ),
                                          Text(
                                            e[1],
                                            style: Styles.kNunitoRegular.copyWith(
                                                fontSize: Screen.kSize14,
                                                color: kNeutral90),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Screen.kSize12,
                              )
                            ],
                          ),
                        );
                      },
                    ).toList()
                  : gaji.take(8).map(
                      (e) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      duration:
                                          const Duration(milliseconds: 100),
                                      child: DetailGajiPage(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Screen.kSize16, vertical: Screen.kSize16),
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x087281DF),
                                        blurRadius: 4.11,
                                        offset: Offset(0, 0.52),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0C7281DF),
                                        blurRadius: 6.99,
                                        offset: Offset(0, 1.78),
                                        spreadRadius: 0,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0F7281DF),
                                        blurRadius: 10.20,
                                        offset: Offset(0, 4.11),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/gaji.svg',
                                        width: Screen.kSize40,
                                      ),
                                      SizedBox(width: Screen.kSize16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rp ${e[0]}',
                                            style: Styles.kPoppinsMedium.copyWith(
                                                fontSize: Screen.kSize18,
                                                color: kBlack),
                                          ),
                                          Text(
                                            e[1],
                                            style: Styles.kNunitoRegular.copyWith(
                                                fontSize: Screen.kSize14,
                                                color: kNeutral90),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Screen.kSize12,
                              )
                            ],
                          ),
                        );
                      },
                    ).toList(),
            ),
            SizedBox(
              height: Screen.kSize8,
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    showAll = !showAll;
                  },
                );
              },
              child: Text(
                showAll ? 'Tampilkan sedikit' : 'Lihat semua',
                style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize14, color: kBlue),
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
