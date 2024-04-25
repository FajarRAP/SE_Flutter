// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants_finals.dart';



class DetailGaji extends StatefulWidget {
  DetailGaji({super.key});

  @override
  State<DetailGaji> createState() => _DetailGajiState();
}

class _DetailGajiState extends State<DetailGaji> {
  bool showAll = false;

  List gaji = ['Pemasukan', 'Potongan'];
  int currentGaji = 0;

  List listGaji = [
    ['3.500.000', 'Januari 2023'],
    ['3.500.000', 'Februari 2023'],
    ['3.500.000', 'Maret 2023'],
    ['3.500.000', 'April 2023'],
    ['3.500.000', 'Mei 2023'],
    ['3.500.000', 'Juni 2023'],
    ['3.500.000', 'Juli 2023'],
    ['3.500.000', 'Agustus 2023'],
    ['3.500.000', 'September 2023'],
    ['3.500.000', 'Oktober 2023'],
    ['3.500.000', 'November 2023'],
    ['3.500.000', 'Desember 2023'],
  ];

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
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
            'Detail Gaji',
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
              child: Container(
                width: Screen.width,
                padding: EdgeInsets.symmetric(
                    horizontal: Screen.kSize20, vertical: Screen.kSize16),
                decoration: ShapeDecoration(
                  color: kBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp 3.500.00',
                      style: Styles.kPoppinsSemiBold.copyWith(
                          fontSize: Screen.kSize28, color: kWhite),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Januari 2023',
                      style: Styles.kNunitoRegular.copyWith(
                          fontSize: Screen.kSize14, color: kNeutral20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Screen.kSize40,
            ),
            Container(
              height: Screen.kSize8,
              color: Color(0xFFEEF2F3),
            ),
            SizedBox(
              height: Screen.kSize32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
              child: SizedBox(
                height: 32,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 12,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: gaji.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            currentGaji = index;
                          },
                        );
                      },
                      child: Container(
                        height: Screen.kSize32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentGaji == index
                              ? const Color(0XffEE6C4D)
                              : kLightGrey,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Center(
                          child: Text(
                            gaji[index],
                            style: Styles.kPoppinsRegular.copyWith(
                              color: currentGaji == index ? kWhite : kNeutral60,
                              fontSize: Screen.kSize12,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Screen.kSize24,
            ),
            Column(
              children: [
                if (currentGaji == 0)
                  Column(
                    children: [
                      Column(
                        children: showAll
                            ? listGaji.map(
                                (e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Screen.kSize20),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Screen.kSize16,
                                              vertical: Screen.kSize16),
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
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/pemasukan.svg',
                                                width: Screen.kSize40,
                                              ),
                                              SizedBox(width: Screen.kSize16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Rp ${e[0]}',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize18,
                                                            color: kBlack),
                                                  ),
                                                  Text(
                                                    e[1],
                                                    style:
                                                        Styles.kNunitoRegular.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              )
                                            ],
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
                            : listGaji.take(8).map(
                                (e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Screen.kSize20),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Screen.kSize16,
                                              vertical: Screen.kSize16),
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
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/pemasukan.svg',
                                                width: Screen.kSize40,
                                              ),
                                              SizedBox(width: Screen.kSize16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Rp ${e[0]}',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize18,
                                                            color: kBlack),
                                                  ),
                                                  Text(
                                                    e[1],
                                                    style:
                                                        Styles.kNunitoRegular.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              )
                                            ],
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
                          style: Styles.kPoppinsMedium.copyWith(
                              fontSize: Screen.kSize14, color: kBlue),
                        ),
                      ),
                    ],
                  )
                else if (currentGaji == 1)
                  Column(
                    children: [
                      Column(
                        children: showAll
                            ? listGaji.map(
                                (e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Screen.kSize20),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Screen.kSize16,
                                              vertical: Screen.kSize16),
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
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/potongan.svg',
                                                width: Screen.kSize40,
                                              ),
                                              SizedBox(width: Screen.kSize16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Rp ${e[0]}',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize18,
                                                            color: kBlack),
                                                  ),
                                                  Text(
                                                    e[1],
                                                    style:
                                                        Styles.kNunitoRegular.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              )
                                            ],
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
                            : listGaji.take(8).map(
                                (e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Screen.kSize20),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Screen.kSize16,
                                              vertical: Screen.kSize16),
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
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/potongan.svg',
                                                width: Screen.kSize40,
                                              ),
                                              SizedBox(width: Screen.kSize16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Rp ${e[0]}',
                                                    style:
                                                        Styles.kPoppinsMedium.copyWith(
                                                            fontSize: Screen.kSize18,
                                                            color: kBlack),
                                                  ),
                                                  Text(
                                                    e[1],
                                                    style:
                                                        Styles.kNunitoRegular.copyWith(
                                                            fontSize: Screen.kSize14,
                                                            color: kNeutral90),
                                                  )
                                                ],
                                              )
                                            ],
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
                          style: Styles.kPoppinsMedium.copyWith(
                              fontSize: Screen.kSize14, color: kBlue),
                        ),
                      ),
                    ],
                  )
              ],
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
