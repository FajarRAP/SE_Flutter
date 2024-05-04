// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';
import 'presensi_pulang.dart';



class PresensiMasuk extends StatefulWidget {
  const PresensiMasuk({super.key});

  @override
  State<PresensiMasuk> createState() => _PresensiMasukState();
}

class _PresensiMasukState extends State<PresensiMasuk> {
  List presensi = [
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '12.30 - 16.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
    [
      'Pagi',
      'Senin, 19 Oktober 2023',
      'Kampus 4',
      '07.00 - 12.00',
    ],
  ];

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Warna dan opasitas shadow
              // Jarak penyebaran shadow
              blurRadius: 4, // Radius blur shadow
              offset: const Offset(0, -1),
            ) // Posisi shadow (x, y)
          ],
        ),
        padding: EdgeInsets.all(Screen.kSize16),
        child: ElevatedButton(
          onPressed: () {
            _presensiMasuk(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kBlue,
              fixedSize: Size(Screen.width, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: Text(
            'Presensi Masuk',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16),
          ),
        ),
      ),
      backgroundColor: kBlue,
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Screen.kSize20, vertical: Screen.kSize16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Screen.kSize24,
                ),
                Text(
                  'Presensi Hari Ini',
                  style: Styles.kPoppinsSemiBold.copyWith(
                      color: kWhite, fontSize: Screen.kSize20),
                ),
                SizedBox(
                  width: Screen.kSize24,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            child: Container(
              width: Screen.width,
              // height: SizeConfig.screenHeight,
              padding: EdgeInsets.symmetric(vertical: Screen.kSize32),
              color: const Color(0xFFF6F7F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Screen.kSize8, horizontal: Screen.kSize16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/tendik/icons/lokasi-presensi.svg'),
                                    SizedBox(
                                      width: Screen.kSize8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Lokasi di luar UAD',
                                        style: Styles.kPoppinsMedium.copyWith(
                                            fontSize: Screen.kSize16, color: kBlack),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                width: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Screen.kSize12,
                                    top: Screen.kSize12,
                                    bottom: Screen.kSize12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Transport',
                                      style: Styles.kNunitoRegular.copyWith(
                                          fontSize: Screen.kSize14, color: kNeutral90),
                                    ),
                                    Text(
                                      'Rp 20.000',
                                      style: Styles.kPoppinsMedium.copyWith(
                                          fontSize: Screen.kSize14, color: kBlack),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: Screen.kSize16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(Screen.kSize16),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/tendik/icons/presensi-masuk-2.svg'),
                                    SizedBox(
                                      width: Screen.kSize8,
                                    ),
                                    Text(
                                      'Masuk',
                                      style: Styles.kPoppinsMedium.copyWith(
                                          fontSize: Screen.kSize16, color: kBlack),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Screen.kSize24,
                                ),
                                Text(
                                  'Belum Presensi',
                                  style: Styles.kPoppinsSemiBold.copyWith(
                                      fontSize: Screen.kSize16, color: kRed),
                                ),
                                SizedBox(
                                  height: Screen.kSize4,
                                ),
                                Text(
                                  'Masuk UAD',
                                  style: Styles.kNunitoRegular.copyWith(
                                      fontSize: Screen.kSize16, color: kNeutral90),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Screen.kSize16,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(Screen.kSize16),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/tendik/icons/presensi-pulang-2.svg'),
                                    SizedBox(
                                      width: Screen.kSize8,
                                    ),
                                    Text(
                                      'Pulang',
                                      style: Styles.kPoppinsMedium.copyWith(
                                          fontSize: Screen.kSize16, color: kBlack),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Screen.kSize24,
                                ),
                                Text(
                                  'Belum Presensi',
                                  style: Styles.kPoppinsSemiBold.copyWith(
                                      fontSize: Screen.kSize16, color: kRed),
                                ),
                                // SizedBox(
                                //   height: Screen.kSize12,
                                // ),
                                // Text(
                                //   '-',
                                //   style: Styles.kPoppinsSemiBold.copyWith(
                                //       fontSize: Screen.kSize24, color: kBlack),
                                // ),
                                SizedBox(
                                  height: Screen.kSize4,
                                ),
                                Text(
                                  'Keluar UAD',
                                  style: Styles.kNunitoRegular.copyWith(
                                      fontSize: Screen.kSize16, color: kNeutral90),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Container(
                    height: 8,
                    color: const Color(0xFFEEF2F3),
                  ),
                  SizedBox(
                    height: Screen.kSize24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                    child: Text(
                      'Shift berikutnya',
                      style: Styles.kPoppinsMedium.copyWith(
                          fontSize: Screen.kSize16, color: kNeutral70),
                    ),
                  ),
                  SizedBox(
                    height: Screen.kSize12,
                  ),
                  Column(
                      children: showAll
                          ? presensi.map((e) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Screen.kSize20),
                                    child: Container(
                                      padding: EdgeInsets.all(Screen.kSize12),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pagi',
                                                style:
                                                    Styles.kPoppinsSemiBold.copyWith(
                                                        fontSize: Screen.kSize14,
                                                        color: kBlack),
                                              ),
                                              Text(
                                                'Senin, 19 Oktober 2023',
                                                style: Styles.kPoppinsMedium.copyWith(
                                                    fontSize: Screen.kSize14,
                                                    color: kNeutral90),
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/tunjangan-beras-location.svg'),
                                                  SizedBox(
                                                    width: Screen.kSize4,
                                                  ),
                                                  Text(
                                                    'Kampus 1 UAD',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/tendik/icons/pukul.svg',
                                                    color: kGreen,
                                                  ),
                                                  SizedBox(
                                                    width: Screen.kSize4,
                                                  ),
                                                  Text(
                                                    '07.00 - 14.00',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              ),
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
                              );
                            }).toList()
                          : presensi.take(3).map((e) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Screen.kSize20),
                                    child: Container(
                                      padding: EdgeInsets.all(Screen.kSize12),
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pagi',
                                                style:
                                                    Styles.kPoppinsSemiBold.copyWith(
                                                        fontSize: Screen.kSize14,
                                                        color: kBlack),
                                              ),
                                              Text(
                                                'Senin, 19 Oktober 2023',
                                                style: Styles.kPoppinsMedium.copyWith(
                                                    fontSize: Screen.kSize14,
                                                    color: kNeutral90),
                                              ),
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/tunjangan-beras-location.svg'),
                                                  SizedBox(
                                                    width: Screen.kSize4,
                                                  ),
                                                  Text(
                                                    'Kampus 1 UAD',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/tendik/icons/pukul.svg',
                                                    color: kGreen,
                                                  ),
                                                  SizedBox(
                                                    width: Screen.kSize4,
                                                  ),
                                                  Text(
                                                    '07.00 - 14.00',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              ),
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
                              );
                            }).toList()),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        setState(
                          () {
                            showAll = !showAll;
                          },
                        );
                      },
                      child: Text(
                        showAll ? 'Tampilkan Sedikit' : 'Lihat Semua',
                        style: Styles.kPoppinsMedium.copyWith(
                            fontSize: Screen.kSize14, color: kBlue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _presensiMasuk(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierColor: const Color(0xCC293241),
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(Screen.kSize40),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Screen.kSize24), // Sesuaikan nilai border radius
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/check.svg'),
              SizedBox(
                height: Screen.kSize24,
              ),
              Text(
                'Presensi Masuk\nBerhasil',
                textAlign: TextAlign.center,
                style:
                    Styles.kPoppinsSemiBold.copyWith(fontSize: Screen.kSize20, color: kBlack),
              ),
              SizedBox(
                height: Screen.kSize40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 100),
                      child: const PresensiPulang(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B86C4),
                    fixedSize: Size(Screen.width, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64),
                    )),
                child: Text(
                  'Oke',
                  style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
