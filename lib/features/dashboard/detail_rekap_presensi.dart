// ignore_for_file: deprecated_member_use

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants_finals.dart';


class DetailRekapPresensi extends StatefulWidget {
  const DetailRekapPresensi({super.key});

  @override
  State<DetailRekapPresensi> createState() => _DetailRekapPresensiState();
}

class _DetailRekapPresensiState extends State<DetailRekapPresensi> {
  int month = DateTime.now().month;
  int year = DateTime.now().year;

  List presensi = [
    ['Senin', '28', 'Absen', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'Telat', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
    ['Senin', '28', 'On time', 'Kampus 4', '20.000', '06.45', '17.00'],
  ];

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Screen.kSize20, vertical: Screen.kSize16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/arrow-left.svg',
                    color: kWhite,
                    fit: BoxFit.scaleDown,
                    width: 24,
                    height: 24,
                  ),
                ),
                Text(
                  'Rekap Bulanan',
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
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: Screen.kSize20),
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                            child: Text(
                              'Statistik Tendik',
                              style: Styles.kNunitoRegular.copyWith(
                                  fontSize: Screen.kSize16, color: kNeutral90),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                            child: InkWell(
                              onTap: () {
                                showMonthPicker(context,
                                    onSelected: (month, year) {
                                  if (kDebugMode) {
                                    print(
                                        'Selected month: $month, year: $year');
                                  }
                                  setState(() {
                                    this.month = month;
                                    this.year = year;
                                  });
                                },
                                    firstEnabledMonth: 3,
                                    lastEnabledMonth: 10,
                                    firstYear: 2000,
                                    lastYear: 2025,
                                    selectButtonText: 'OK',
                                    cancelButtonText: 'Cancel',
                                    highlightColor: kBlue,
                                    textColor: kBlack,
                                    contentBackgroundColor: Colors.white,
                                    dialogBackgroundColor: Colors.grey[200]);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Bulan $month, $year',
                                    style: Styles.kPoppinsSemiBold.copyWith(
                                        fontSize: Screen.kSize24, color: kNeutral90),
                                  ),
                                  SizedBox(
                                    width: Screen.kSize4,
                                  ),
                                  SvgPicture.asset(
                                      'assets/icons/arrow-right.svg')
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Screen.kSize16,
                          ),
                          PieChartPresensi(),
                        ],
                      ),
                    ),
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
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/tendik/icons/rekap-gaji.svg'),
                                    SizedBox(
                                      width: Screen.kSize8,
                                    ),
                                    Text(
                                      'Transport',
                                      style: Styles.kPoppinsMedium.copyWith(
                                          fontSize: Screen.kSize16, color: kBlack),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Screen.kSize12,
                                ),
                                Text(
                                  'Rp 240.000',
                                  style: Styles.kPoppinsSemiBold.copyWith(
                                      fontSize: Screen.kSize20, color: kBlack),
                                ),
                                SizedBox(
                                  height: Screen.kSize4,
                                ),
                                Text(
                                  'Rupiah',
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
                                        'assets/tendik/icons/rekap-total-hari.svg'),
                                    SizedBox(
                                      width: Screen.kSize8,
                                    ),
                                    Text(
                                      'Total hari',
                                      style: Styles.kPoppinsMedium.copyWith(
                                          fontSize: Screen.kSize16, color: kBlack),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Screen.kSize12,
                                ),
                                Text(
                                  '12',
                                  style: Styles.kPoppinsSemiBold.copyWith(
                                      fontSize: Screen.kSize20, color: kBlack),
                                ),
                                SizedBox(
                                  height: Screen.kSize4,
                                ),
                                Text(
                                  'Hari kerja',
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
                  Column(
                      children: showAll
                          ? presensi.map(
                              (e) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Screen.kSize20),
                                      child: Container(
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
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Screen.kSize12,
                                                  vertical: Screen.kSize8),
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              top: Screen.kSize12,
                                                              right: Screen.kSize12,
                                                              bottom: Screen.kSize12,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  e[0],
                                                                  style: Styles.kNunitoRegular.copyWith(
                                                                      fontSize:
                                                                          Screen.kSize14,
                                                                      color:
                                                                          kNeutral90),
                                                                ),
                                                                Text(
                                                                  e[1],
                                                                  style: Styles.kPoppinsMedium.copyWith(
                                                                      fontSize:
                                                                          Screen.kSize20,
                                                                      color:
                                                                          kBlack),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const VerticalDivider(
                                                            width: 1,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      Screen.kSize12),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    e[2],
                                                                    style: Styles.kPoppinsMedium.copyWith(
                                                                        fontSize: Screen.kSize18,
                                                                        color: e[2] == 'On time'
                                                                            ? kGreen
                                                                            : e[2] == 'Telat'
                                                                                ? kYellow
                                                                                : kRed),
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                              'assets/icons/tunjangan-beras-location.svg'),
                                                                      SizedBox(
                                                                        width:
                                                                            Screen.kSize4,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          e[3],
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: Styles.kNunitoRegular.copyWith(
                                                                              fontSize: Screen.kSize14,
                                                                              color: kNeutral90),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const VerticalDivider(
                                                      width: 1,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  Screen.kSize12,
                                                              vertical:
                                                                  Screen.kSize12),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Transport',
                                                            style: Styles.kNunitoRegular.copyWith(
                                                                fontSize:
                                                                    Screen.kSize14,
                                                                color:
                                                                    kNeutral90),
                                                          ),
                                                          Text(
                                                            e[4],
                                                            style: Styles.kPoppinsMedium
                                                                .copyWith(
                                                                    fontSize:
                                                                        Screen.kSize14,
                                                                    color:
                                                                        kBlack),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(
                                                Screen.kSize12,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/tendik/icons/riwayat-presensi-masuk.svg'),
                                                      SizedBox(
                                                        width: Screen.kSize4,
                                                      ),
                                                      Text(
                                                        'Masuk :',
                                                        style: Styles.kNunitoRegular
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize14,
                                                                color:
                                                                    kNeutral90),
                                                      ),
                                                      SizedBox(
                                                        width: Screen.kSize8,
                                                      ),
                                                      Text(
                                                        e[5],
                                                        style: Styles.kPoppinsMedium
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize16,
                                                                color: kBlue),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/tendik/icons/riwayat-presensi-pulang.svg'),
                                                      SizedBox(
                                                        width: Screen.kSize4,
                                                      ),
                                                      Text(
                                                        'Masuk :',
                                                        style: Styles.kNunitoRegular
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize14,
                                                                color:
                                                                    kNeutral90),
                                                      ),
                                                      SizedBox(
                                                        width: Screen.kSize8,
                                                      ),
                                                      Text(
                                                        e[6],
                                                        style: Styles.kPoppinsMedium
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize16,
                                                                color: kBlue),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                              },
                            ).toList()
                          : presensi.take(8).map(
                              (e) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Screen.kSize20),
                                      child: Container(
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
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Screen.kSize12,
                                                  vertical: Screen.kSize8),
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              top: Screen.kSize12,
                                                              right: Screen.kSize12,
                                                              bottom: Screen.kSize12,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  e[0],
                                                                  style: Styles.kNunitoRegular.copyWith(
                                                                      fontSize:
                                                                          Screen.kSize14,
                                                                      color:
                                                                          kNeutral90),
                                                                ),
                                                                Text(
                                                                  e[1],
                                                                  style: Styles.kPoppinsMedium.copyWith(
                                                                      fontSize:
                                                                          Screen.kSize20,
                                                                      color:
                                                                          kBlack),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const VerticalDivider(
                                                            width: 1,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      Screen.kSize12),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    e[2],
                                                                    style: Styles.kPoppinsMedium.copyWith(
                                                                        fontSize: Screen.kSize18,
                                                                        color: e[2] == 'On time'
                                                                            ? kGreen
                                                                            : e[2] == 'Telat'
                                                                                ? kYellow
                                                                                : kRed),
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                              'assets/icons/tunjangan-beras-location.svg'),
                                                                      SizedBox(
                                                                        width:
                                                                            Screen.kSize4,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          e[3],
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: Styles.kNunitoRegular.copyWith(
                                                                              fontSize: Screen.kSize14,
                                                                              color: kNeutral90),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const VerticalDivider(
                                                      width: 1,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  Screen.kSize12,
                                                              vertical:
                                                                  Screen.kSize12),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Transport',
                                                            style: Styles.kNunitoRegular.copyWith(
                                                                fontSize:
                                                                    Screen.kSize14,
                                                                color:
                                                                    kNeutral90),
                                                          ),
                                                          Text(
                                                            e[4],
                                                            style: Styles.kPoppinsMedium
                                                                .copyWith(
                                                                    fontSize:
                                                                        Screen.kSize14,
                                                                    color:
                                                                        kBlack),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(
                                                Screen.kSize12,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/tendik/icons/riwayat-presensi-masuk.svg'),
                                                      SizedBox(
                                                        width: Screen.kSize4,
                                                      ),
                                                      Text(
                                                        'Masuk :',
                                                        style: Styles.kNunitoRegular
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize14,
                                                                color:
                                                                    kNeutral90),
                                                      ),
                                                      SizedBox(
                                                        width: Screen.kSize8,
                                                      ),
                                                      Text(
                                                        e[5],
                                                        style: Styles.kPoppinsMedium
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize16,
                                                                color: kBlue),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/tendik/icons/riwayat-presensi-pulang.svg'),
                                                      SizedBox(
                                                        width: Screen.kSize4,
                                                      ),
                                                      Text(
                                                        'Masuk :',
                                                        style: Styles.kNunitoRegular
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize14,
                                                                color:
                                                                    kNeutral90),
                                                      ),
                                                      SizedBox(
                                                        width: Screen.kSize8,
                                                      ),
                                                      Text(
                                                        e[6],
                                                        style: Styles.kPoppinsMedium
                                                            .copyWith(
                                                                fontSize:
                                                                    Screen.kSize16,
                                                                color: kBlue),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
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
                              },
                            ).toList()),
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
                      style: Styles.kPoppinsMedium.copyWith(
                          fontSize: Screen.kSize14, color: kBlue),
                    ),
                  ),
                  SizedBox(
                    height: Screen.height * .8,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PresensiChart extends StatelessWidget {
  const PresensiChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 20, color: kYellow),
          PieChartSectionData(value: 20, color: kGreen),
          PieChartSectionData(value: 20, color: kRed),
        ],
      ),
    );
  }
}

class PieChartPresensi extends StatelessWidget {
  PieChartPresensi({super.key});

  final data = [
    {'presensi': 'On time', 'jumlah': 10},
    {'presensi': 'Telat', 'jumlah': 2},
    {'presensi': 'Absen', 'jumlah': 2}
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 10,
                  title: '',
                  badgePositionPercentageOffset: 1,
                  badgeWidget: Container(
                    decoration: BoxDecoration(
                        color: kGreen,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: kNeutral40)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.kSize8, vertical: Screen.kSize4),
                    child: Text(
                      'On time: 10',
                      style: Styles.kNunitoRegular.copyWith(
                          fontSize: Screen.kSize14, color: kWhite),
                    ),
                  ),
                  titleStyle:
                      Styles.kNunitoRegular.copyWith(fontSize: Screen.kSize14, color: kBlack),
                  showTitle: true,
                  radius: 32,
                  color: kGreen,
                ),
                PieChartSectionData(
                  value: 2,
                  title: '',
                  badgePositionPercentageOffset: 1,
                  badgeWidget: Container(
                    decoration: BoxDecoration(
                        color: kRed,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: kNeutral40)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.kSize8, vertical: Screen.kSize4),
                    child: Text(
                      'Absen: 2',
                      style: Styles.kNunitoRegular.copyWith(
                          fontSize: Screen.kSize14, color: kWhite),
                    ),
                  ),
                  titleStyle:
                      Styles.kNunitoRegular.copyWith(fontSize: Screen.kSize14, color: kBlack),
                  showTitle: true,
                  radius: 32,
                  color: kRed,
                ),
                PieChartSectionData(
                  value: 2,
                  title: '',
                  badgePositionPercentageOffset: 1,
                  badgeWidget: Container(
                    decoration: BoxDecoration(
                        color: kYellow,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: kNeutral40)),
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.kSize8, vertical: Screen.kSize4),
                    child: Text(
                      'Telat: 2',
                      style: Styles.kNunitoRegular.copyWith(
                          fontSize: Screen.kSize14, color: kBlack),
                    ),
                  ),
                  titleStyle:
                      Styles.kNunitoRegular.copyWith(fontSize: Screen.kSize14, color: kBlack),
                  showTitle: true,
                  radius: 32,
                  color: kYellow,
                )
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Presensi',
                  style: Styles.kNunitoRegular.copyWith(
                      fontSize: Screen.kSize14, color: kNeutral70),
                ),
                SizedBox(
                  height: Screen.kSize4,
                ),
                Text(
                  '14',
                  style: Styles.kPoppinsSemiBold.copyWith(
                      fontSize: Screen.kSize40, color: kBlack),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
