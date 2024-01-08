// import 'package:adisty_mobile_dosen/screens/08-agenda/detail_agenda.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:page_transition/page_transition.dart';

import '../helper/app_styles.dart';
import '../helper/size_config.dart';

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  List agenda = ['Berjalan', 'Selesai'];
  bool isBerjalan = true;
  bool isSelesai = false;

  int month = DateTime.now().month;
  int year = DateTime.now().year;

  List listAgenda = [
    [
      'Perancangan Arsitektur Game Virtual Academic',
      'Biro Sistem Informasi',
      'baru saja'
    ],
    [
      'Perancangan Arsitektur Game Virtual Academic',
      'Biro Sistem Informasi',
      '15 menit yang lalu'
    ],
    [
      'Perancangan Arsitektur Game Virtual Academic',
      'Biro Sistem Informasi',
      '28/10/2023'
    ],
    [
      'Perancangan Arsitektur Game Virtual Academic',
      'Biro Sistem Informasi',
      '20/10/2023'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    print("BUILDED");
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                vertical: SizeConfig.blockSizeHorizontal! * 3.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // InkWell(
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                //   child: SvgPicture.asset(
                //     'assets/icons/arrow-left.svg',
                //     color: kWhite,
                //     fit: BoxFit.scaleDown,
                //     width: 24,
                //     height: 24,
                //   ),
                // ),
                Text(
                  'Agenda',
                  style: kPoppinsSemiBold.copyWith(
                      color: kWhite,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4.675),
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 5.5,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            child: Container(
              width: SizeConfig.screenWidth,
              // height: SizeConfig.screenHeight,
              padding: EdgeInsets.fromLTRB(
                SizeConfig.blockSizeHorizontal! * 4.675,
                SizeConfig.blockSizeHorizontal! * 7.5,
                SizeConfig.blockSizeHorizontal! * 4.675,
                SizeConfig.blockSizeHorizontal! * 7.5,
              ),
              color: const Color(0xFFF6F7F9),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  isBerjalan = true;
                                  isSelesai = false;
                                },
                              );
                            },
                            child: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isBerjalan
                                    ? const Color(0XffEE6C4D)
                                    : kLightGrey,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal! * 3.75,
                                vertical:
                                    SizeConfig.blockSizeHorizontal! * 1.87,
                              ),
                              child: Center(
                                child: Text(
                                  'Berjalan',
                                  style: kPoppinsRegular.copyWith(
                                    color: isBerjalan ? kWhite : kNeutral60,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2.85,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 2.85,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  isBerjalan = false;
                                  isSelesai = true;
                                },
                              );
                            },
                            child: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: isSelesai
                                    ? const Color(0XffEE6C4D)
                                    : kLightGrey,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal! * 3.75,
                                vertical:
                                    SizeConfig.blockSizeHorizontal! * 1.87,
                              ),
                              child: Center(
                                child: Text(
                                  'Selesai',
                                  style: kPoppinsRegular.copyWith(
                                    color: isSelesai ? kWhite : kNeutral60,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 2.85,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // showMonthPicker(context, onSelected: (month, year) {
                          //   if (kDebugMode) {
                          //     print('Selected month: $month, year: $year');
                          //   }
                          //   setState(() {
                          //     this.month = month;
                          //     this.year = year;
                          //   });
                          // },
                          //     firstEnabledMonth: 3,
                          //     lastEnabledMonth: 10,
                          //     firstYear: 2000,
                          //     lastYear: 2025,
                          //     selectButtonText: 'OK',
                          //     cancelButtonText: 'Cancel',
                          //     highlightColor: kBlue,
                          //     textColor: kBlack,
                          //     contentBackgroundColor: Colors.white,
                          //     dialogBackgroundColor: Colors.grey[200]);
                        },
                        child: Row(
                          children: [
                            // SvgPicture.asset('assets/icons/calendar.svg'),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 1,
                            ),
                            Text(
                              'Bulan $month, $year',
                              style: kPoppinsMedium.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.25,
                                  color: kNeutral80),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 1,
                            ),
                            // SvgPicture.asset(
                            //   'assets/icons/arrow-right.svg',
                            //   width: SizeConfig.blockSizeHorizontal! * 4.25,
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(
                  //   height: 32,
                  //   child: ListView.separated(
                  //     separatorBuilder: (context, index) => const SizedBox(
                  //       width: 12,
                  //     ),
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: agenda.length,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(
                  //             () {
                  //               currentAgenda = index;
                  //             },
                  //           );
                  //         },
                  //         child: Container(
                  //           height: 32,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(12),
                  //             color: currentAgenda == index
                  //                 ? const Color(0XffEE6C4D)
                  //                 : kLightGrey,
                  //           ),
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 16,
                  //             vertical: 8,
                  //           ),
                  //           child: Center(
                  //             child: Text(
                  //               agenda[index],
                  //               style: kPoppinsRegular.copyWith(
                  //                 color: currentAgenda == index
                  //                     ? kWhite
                  //                     : kNeutral60,
                  //                 fontSize: 12,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: SizeConfig.blockSizeHorizontal! * 5.5,
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12),
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         color: Color(0x087281df),
                  //         blurRadius: 4.11,
                  //         offset: Offset(0, 0.52),
                  //       ),
                  //       BoxShadow(
                  //         color: Color(0x0c7281df),
                  //         blurRadius: 6.99,
                  //         offset: Offset(0, 1.78),
                  //       ),
                  //       BoxShadow(
                  //         color: Color(0x0f7281df),
                  //         blurRadius: 10.20,
                  //         offset: Offset(0, 4.11),
                  //       ),
                  //     ],
                  //     color: Colors.white,
                  //   ),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       isDense: false,
                  //       filled: true,
                  //       fillColor: Colors.transparent,
                  //       contentPadding: EdgeInsets.all(
                  //           SizeConfig.blockSizeHorizontal! * 3.75),
                  //       // ignore: prefer_const_constructors
                  //       // prefixIcon: SvgPicture.asset(
                  //       //   'assets/icons/search.svg',
                  //       //   width: 24,
                  //       //   fit: BoxFit.scaleDown,
                  //       // ),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(16),
                  //           borderSide: BorderSide.none),
                  //       hintText: "Cari mahasiswa",
                  //       hintStyle: kNunitoRegular.copyWith(
                  //         fontSize: SizeConfig.blockSizeHorizontal! * 3.75,
                  //         color: const Color(0XffAEB1B7),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: SizeConfig.blockSizeHorizontal! * 4.675,
                  // ),
                  // Column(
                  //   children: listAgenda.map(
                  //     (akademik) {
                  //       return InkWell(
                  //         onTap: () {
                  //           // Navigator.push(
                  //           //   context,
                  //           //   PageTransition(
                  //           //     duration: const Duration(milliseconds: 100),
                  //           //     child: const DetailAgenda(),
                  //           //     type: PageTransitionType.fade,
                  //           //   ),
                  //           // );
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(
                  //               bottom: SizeConfig.blockSizeHorizontal! * 2.85),
                  //           width: SizeConfig.screenWidth,
                  //           padding: const EdgeInsets.all(12),
                  //           decoration: ShapeDecoration(
                  //             color: Colors.white,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(12),
                  //             ),
                  //             shadows: const [
                  //               BoxShadow(
                  //                 color: Color(0x087281DF),
                  //                 blurRadius: 4.11,
                  //                 offset: Offset(0, 0.52),
                  //                 spreadRadius: 0,
                  //               ),
                  //               BoxShadow(
                  //                 color: Color(0x0C7281DF),
                  //                 blurRadius: 6.99,
                  //                 offset: Offset(0, 1.78),
                  //                 spreadRadius: 0,
                  //               ),
                  //               BoxShadow(
                  //                 color: Color(0x0F7281DF),
                  //                 blurRadius: 10.20,
                  //                 offset: Offset(0, 4.11),
                  //                 spreadRadius: 0,
                  //               )
                  //             ],
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 akademik[0],
                  //                 maxLines: 1,
                  //                 overflow: TextOverflow.ellipsis,
                  //                 style: kPoppinsMedium.copyWith(
                  //                     fontSize:
                  //                         SizeConfig.blockSizeHorizontal! *
                  //                             3.25,
                  //                     color: kBlack),
                  //               ),
                  //               SizedBox(
                  //                 width: SizeConfig.blockSizeHorizontal! * 1,
                  //               ),
                  //               RichText(
                  //                 text: TextSpan(
                  //                   children: <TextSpan>[
                  //                     TextSpan(
                  //                         text: 'Dari: ',
                  //                         style: kNunitoRegular.copyWith(
                  //                             fontSize: SizeConfig
                  //                                     .blockSizeHorizontal! *
                  //                                 3.25,
                  //                             color: kNeutral80)),
                  //                     TextSpan(
                  //                         text: akademik[1],
                  //                         style: kNunitoRegular.copyWith(
                  //                             fontSize: SizeConfig
                  //                                     .blockSizeHorizontal! *
                  //                                 3.25,
                  //                             color: kBlue)),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Align(
                  //                 alignment: Alignment.bottomRight,
                  //                 child: Text(
                  //                   akademik[2],
                  //                   style: kNunitoRegular.copyWith(
                  //                       fontSize:
                  //                           SizeConfig.blockSizeHorizontal! *
                  //                               2.85,
                  //                       color: kNeutral70),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ).toList(),
                  // ),
                  // SizedBox(
                  //   height: SizeConfig.screenHeight! * .8,
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
