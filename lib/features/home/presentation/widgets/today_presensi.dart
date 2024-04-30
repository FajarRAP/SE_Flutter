import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/constants_finals.dart';
import '../../../dashboard/detail_presensi_hari_ini.dart';

class TodayPresensi extends StatelessWidget {
  const TodayPresensi({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              duration: const Duration(milliseconds: 100),
              child: const DetailPresensiHariIni(),
              type: PageTransitionType.fade,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          height: 400,
          decoration: BoxDecoration(
              color: kBlue, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/tendik/images/tendik.png',
                  width: 115,
                ),
              ),
              Text(
                "Minggu, 13 September 2024",
                style:
                    Styles.kPoppinsMedium.copyWith(fontSize: 14, color: kWhite),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: const Color(0xFFF1416C),
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Kampus 4',
                        style: Styles.kPoppinsRegular
                            .copyWith(fontSize: 16, color: kWhite),
                      ),
                    ],
                  ),
                  Text(
                    'Laboratorium Terpadu UAD Kampus 4',
                    textAlign: TextAlign.center,
                    style: Styles.kPoppinsRegular
                        .copyWith(fontSize: 12, color: kWhite),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                'assets/tendik/icons/home-presensi-masuk.svg'),
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Masuk',
                                  style: Styles.kNunitoRegular
                                      .copyWith(fontSize: 12, color: kWhite),
                                ),
                                Text(
                                  '06.45',
                                  style: Styles.kPoppinsBold
                                      .copyWith(fontSize: 14, color: kWhite),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                              'assets/tendik/icons/home-presensi-pulang.svg'),
                          SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pulang',
                                style: Styles.kNunitoRegular
                                    .copyWith(fontSize: 12, color: kWhite),
                              ),
                              Text(
                                '17.04',
                                style: Styles.kPoppinsBold
                                    .copyWith(fontSize: 14, color: kWhite),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SvgPicture.asset(
                            //     'assets/tendik/icons/home-presensi-masuk.svg'),

                            Icon(
                              Icons.calendar_month,
                              color: kWhite,
                              size: 18.0,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Column(
                              children: [
                                // Text(
                                //   'Status Presensi',
                                //   style:
                                //       kNunitoRegular.copyWith(
                                //           fontSize: kSize12,
                                //           color: kWhite),
                                // ),
                                Text(
                                  'On Time',
                                  style: Styles.kPoppinsBold
                                      .copyWith(fontSize: 14, color: kWhite),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SvgPicture.asset(
                          //     'assets/tendik/icons/home-presensi-pulang.svg'),
                          Icon(
                            Icons.monetization_on,
                            color: kWhite,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Column(
                            children: [
                              // Text(
                              //   'Transport',
                              //   style:
                              //       kNunitoRegular.copyWith(
                              //           fontSize: kSize12,
                              //           color: kWhite),
                              // ),
                              Text(
                                '20.000',
                                style: Styles.kPoppinsBold
                                    .copyWith(fontSize: 14, color: kWhite),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    //   return Expanded(
    //     flex: 5,
    //     child: InkWell(
    //       borderRadius: BorderRadius.circular(20),
    //       onTap: () {
    //         // Navigator.push(
    //         //   context,
    //         //   PageTransition(
    //         //     duration: const Duration(milliseconds: 100),
    //         //     child: const DetailPresensiHariIni(),
    //         //     type: PageTransitionType.fade,
    //         //   ),
    //         // );
    //       },
    //       child: Ink(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 20,
    //           vertical: 16,
    //         ),
    //         decoration: const BoxDecoration(
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(20),
    //           ),
    //           color: kBlue,
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(
    //               child: Image.asset(
    //                 'assets/images/tendik.png',
    //                 width: 125,
    //               ),
    //             ),
    //             Text(
    //               'Presensi Hari Ini',
    //               style: Styles.kNunitoSemiBold.copyWith(
    //                 color: kWhite,
    //                 fontSize: 14,
    //               ),
    //             ),
    //             Text(
    //               '07.00',
    //               style: Styles.kPoppinsBold.copyWith(
    //                 color: kWhite,
    //                 fontSize: 40,
    //               ),
    //             ),
    //             Text(
    //               "Jum'at, 13 Oktober",
    //               style: Styles.Styles.kPoppinsMedium.copyWith(
    //                 color: kWhite,
    //                 fontSize: 14,
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 12,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         SvgPicture.asset(
    //                             'assets/icons/home-presensi-masuk.svg'),
    //                         const SizedBox(
    //                           width: 4,
    //                         ),
    //                         Text(
    //                           'Masuk',
    //                           style: Styles.kNunitoRegular.copyWith(
    //                             color: kWhite,
    //                             fontSize: 12,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Text(
    //                       '06.45',
    //                       style: Styles.kPoppinsBold.copyWith(
    //                         color: kWhite,
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.end,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         SvgPicture.asset(
    //                             'assets/icons/home-presensi-pulang.svg'),
    //                         const SizedBox(
    //                           width: 4,
    //                         ),
    //                         Text(
    //                           'Pulang',
    //                           style: Styles.kNunitoRegular.copyWith(
    //                             color: kWhite,
    //                             fontSize: 12,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     Text(
    //                       '17.04',
    //                       style: Styles.kPoppinsBold.copyWith(
    //                         color: kWhite,
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
  }
}
