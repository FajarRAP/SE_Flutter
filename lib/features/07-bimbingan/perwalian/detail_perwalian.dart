
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'edit_perwalian.dart';
import 'perwalian_sudah_ditanggapi.dart';
import 'tambah_perwalian.dart';
import '../../../core/app_styles.dart';
import '../../../core/size_config.dart';
import 'tanggapi_perwalian.dart';

class DetailPerwalianAkademik extends StatefulWidget {
  const DetailPerwalianAkademik({super.key});

  @override
  State<DetailPerwalianAkademik> createState() =>
      _DetailPerwalianAkademikState();
}

class _DetailPerwalianAkademikState extends State<DetailPerwalianAkademik> {
  bool showAll = false;

  List perwalian = [
    [
      'avatar-2.png',
      'Agung Nurul Huda',
      'Perwalian setelah UTS',
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      'baru saja'
    ],
    [
      'avatar-1.png',
      'Ponco SA',
      'Perwalian sebelum UTS',
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      '1 jam yang lalu'
    ],
    [
      'avatar-2.png',
      'Agung Nurul Huda',
      'Perwalian sebelum UTS',
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      '29/10/2023'
    ]
  ];

  List statusPerwalian = ['Semua', 'Dikirim', 'Diterima'];
  int currentPerwalian = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: MyRectangularButton(),
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675, vertical: SizeConfig.blockSizeHorizontal! * 3.75),
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
                  'Perwalian Akademik',
                  style: kPoppinsSemiBold.copyWith(
                      color: kWhite, fontSize: SizeConfig.blockSizeHorizontal! * 4.675),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 5.5,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            child: Container(
              width: SizeConfig.screenWidth,
              // height: SizeConfig.screenHeight,
              padding: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeHorizontal! * 7.5),
              color: const Color(0xFFF6F7F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3.75),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/avatar-2.png',
                              width: SizeConfig.blockSizeHorizontal! * 11.2,
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 2.85,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Agung Nurul Huda',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kBlack),
                                ),
                                Text(
                                  '1900018416',
                                  style: kNunitoRegular.copyWith(
                                      fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kBlue),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 2.85,
                        ),
                        const Divider(),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 2.85,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Program Studi',
                                style: kNunitoRegular.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
                              ),
                            ),
                            Text(
                              '  :  ',
                              style: kNunitoRegular.copyWith(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Informatika',
                                style: kPoppinsRegular.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kBlack),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 1.87,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Semester',
                                style: kNunitoRegular.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
                              ),
                            ),
                            Text(
                              '  :  ',
                              style: kNunitoRegular.copyWith(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '3 (ganjil 2020/2021)',
                                style: kPoppinsRegular.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kBlack),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 1.87,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                'Total Bimbingan',
                                style: kNunitoRegular.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
                              ),
                            ),
                            Text(
                              '  :  ',
                              style: kNunitoRegular.copyWith(
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kNeutral70),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '8x',
                                style: kPoppinsMedium.copyWith(
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kOrange),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 1.87,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 8,
                    color: kLightGrey,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 5.5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                    child: Text(
                      'Aktivitas Perwalian',
                      style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.25, color: kBlack),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 2.85,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 7.5,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                      separatorBuilder: (context, index) => SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 2.85,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: statusPerwalian.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                currentPerwalian = index;
                              },
                            );
                          },
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: currentPerwalian == index
                                  ? const Color(0XffEE6C4D)
                                  : kLightGrey,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal! * 3.75,
                              vertical: SizeConfig.blockSizeHorizontal! * 1.87,
                            ),
                            child: Center(
                              child: Text(
                                statusPerwalian[index],
                                style: kPoppinsRegular.copyWith(
                                  color: currentPerwalian == index
                                      ? kWhite
                                      : kNeutral60,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 2.85,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeHorizontal! * 5.5,
                  ),
                  Column(
                    children: perwalian.map(
                      (dataPerwalian) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      duration:
                                          const Duration(milliseconds: 100),
                                      child: dataPerwalian[1] == 'Ponco SA'
                                          ? TanggapiPerwalian()
                                          : SudahTanggapiPerwalian(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 3.75),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/${dataPerwalian[0]}',
                                            width: SizeConfig
                                                    .blockSizeHorizontal! *
                                                11.2,
                                          ),
                                          SizedBox(
                                            width: SizeConfig.blockSizeHorizontal! * 2.85,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      dataPerwalian[1],
                                                      style: kPoppinsMedium
                                                          .copyWith(
                                                              fontSize: SizeConfig.blockSizeHorizontal! * 3.25,
                                                              color: kBlack),
                                                    ),
                                                    Text(
                                                      dataPerwalian[2],
                                                      style: kNunitoRegular
                                                          .copyWith(
                                                              fontSize: SizeConfig.blockSizeHorizontal! * 3.25,
                                                              color: kBlue),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        child:
                                                            const EditPerwalian(),
                                                        type: PageTransitionType
                                                            .fade,
                                                      ),
                                                    );
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/icons/edit-perwalian.svg',
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: SizeConfig.blockSizeHorizontal! * 2.35,
                                      ),
                                      const Divider(),
                                      SizedBox(
                                        height: SizeConfig.blockSizeHorizontal! * 2.35,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: SizeConfig.blockSizeHorizontal! * 7.5),
                                        child: Text(
                                          dataPerwalian[3],
                                          style: kNunitoRegular.copyWith(
                                            fontSize: SizeConfig.blockSizeHorizontal! * 3.25,
                                            color: kNeutral80,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.blockSizeHorizontal! * 1.87,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          dataPerwalian[4],
                                          style: kNunitoRegular.copyWith(
                                            fontSize: SizeConfig.blockSizeHorizontal! * 2.85,
                                            color: kNeutral70,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeHorizontal! * 2.85,
                            )
                          ],
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * .8,
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

class MyRectangularButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 100),
            child: const TambahPerwalian(),
            type: PageTransitionType.fade,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kBlue,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(24.0), // Mengatur border radius di sini
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/icons/tambah-perwalian.svg'),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal! * 1.87,
          ),
          Text(
            'Tambah',
            style: kPoppinsMedium.copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 3.25, color: kWhite),
          ),
        ],
      ),
    );
  }
}
