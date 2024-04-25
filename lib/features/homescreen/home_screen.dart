
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:page_transition/page_transition.dart';


import '../../core/constants_finals.dart';
// import '../05-notifications/notifications.dart';
import '../agenda/presentation/pages/agenda.dart';
import '../layanan_cuti/presentation/pages/layanan_cuti.dart';
import '../shift/presentation/pages/jadwal_shift.dart';
import '../tunjangan/presentation/pages/tunjangan.dart';
import 'adisty_sevice.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: Screen.kSize24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                          SizedBox(
                            width: Screen.width * .55,
                            child: Text(
                              'Hallo Agung👋',
                              style: Styles.kPoppinsSemiBold.copyWith(
                                  fontSize: Screen.kSize20, color: kBlack),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            'Selamat datang di Adisty',
                            style: Styles.kNunitoRegular.copyWith(
                                fontSize: Screen.kSize14, color: kGrey),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   PageTransition(
                      //     duration: const Duration(milliseconds: 100),
                      //     child: const NotifikasiKosong(),
                      //     type: PageTransitionType.fade,
                      //   ),
                      // );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/notif.svg',
                      width: Screen.kSize32,
                      color: kBlack,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize16,
            ),
            //----------------------------------------------------
            //------------    HOME DENGAN EVALUASI STUDI   ----------
            //----------------------------------------------------

            // Container(
            //   width: 380,
            //   margin: EdgeInsets.symmetric(horizontal: Screen.kSize24),
            //   padding:  EdgeInsets.all(10),
            //   decoration: ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       side:  BorderSide(width: 1, color: Color(0xFFEEF2F3)),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     shadows: [
            //       BoxShadow(
            //         color: Color(0x087281DF),
            //         blurRadius: 4.11,
            //         offset: Offset(0, 0.52),
            //         spreadRadius: 0,
            //       ),
            //       BoxShadow(
            //         color: Color(0x0C7281DF),
            //         blurRadius: 6.99,
            //         offset: Offset(0, 1.78),
            //         spreadRadius: 0,
            //       ),
            //       BoxShadow(
            //         color: Color(0x0F7281DF),
            //         blurRadius: 10.20,
            //         offset: Offset(0, 4.11),
            //         spreadRadius: 0,
            //       )
            //     ],
            //   ),
            //   child: Row(
            //     children: [
            //       SvgPicture.asset(
            //         'assets/icons/evaluasi-studi-1.svg',
            //         width: Screen.kSize32,
            //       ),
            //        SizedBox(
            //         width: 8,
            //       ),
            //       Expanded(
            //         child: Text(
            //           'Jabatan Fungsional kamu lebih dari 1 tahun 6 bulan.',
            //           style: Styles.kNunitoRegular.copyWith(
            //             fontSize: 14,
            //             color: kNeutral80,
            //           ),
            //           maxLines: 1,
            //           overflow: TextOverflow.ellipsis,
            //         ),
            //       ),
            //        SizedBox(
            //         width: 8,
            //       ),
            //       SvgPicture.asset(
            //         'assets/icons/arrow-right.svg',
            //         width: Screen.kSize18,
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 10,
                    child: SizedBox(
                      height: Screen.blockSizeHorizontal * 73,
                      child: Column(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   PageTransition(
                                //     duration: const Duration(milliseconds: 100),
                                //     child: const DetailRekapPresensi(),
                                //     type: PageTransitionType.fade,
                                //   ),
                                // );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(Screen.kSize20),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: Screen.kSize16),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD5ECFF)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Presensi',
                                        style: Styles.kPoppinsBold.copyWith(
                                            fontSize: Screen.kSize18, color: kBlack),
                                      ),
                                      Text(
                                        '19',
                                        style: Styles.kPoppinsBold.copyWith(
                                            fontSize: Screen.kSize40, color: kBlack),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Bulan ini',
                                            style: Styles.kNunitoBold.copyWith(
                                                fontSize: Screen.kSize16,
                                                color: kBlack),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Screen.kSize12,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   PageTransition(
                                //     duration: const Duration(milliseconds: 100),
                                //     child: const Agenda(),
                                //     type: PageTransitionType.fade,
                                //   ),
                                // );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(Screen.kSize20),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: Screen.kSize16),
                                  decoration:
                                      const BoxDecoration(color: kOrange),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Agenda',
                                        style: Styles.kPoppinsBold.copyWith(
                                            fontSize: Screen.kSize18, color: kWhite),
                                      ),
                                      Text(
                                        '2',
                                        style: Styles.kPoppinsBold.copyWith(
                                            fontSize: Screen.kSize40, color: kWhite),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Hari ini',
                                            style: Styles.kNunitoBold.copyWith(
                                                fontSize: Screen.kSize16,
                                                color: kWhite),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Screen.kSize12,
                  ),
                  Expanded(
                    flex: 17,
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     duration: const Duration(milliseconds: 100),
                        //     child: const DetailPresensiHariIni(),
                        //     type: PageTransitionType.fade,
                        //   ),
                        // );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Screen.kSize20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Screen.kSize20, vertical: Screen.kSize16),
                          height: Screen.blockSizeHorizontal * 73,
                          decoration: const BoxDecoration(color: kBlue),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  'assets/tendik/images/tendik.png',
                                  width: Screen.blockSizeHorizontal * 30,
                                ),
                              ),
                              // ---------------------------------------------
                              // ------- TIDAK ADA PERKULIAHAN HARI INI ------
                              // ---------------------------------------------
                              // SizedBox(
                              //   height: Screen.kSize16,
                              // ),
                              // SvgPicture.asset(
                              //   'assets/tendik/icons/tidak-presensi-hari-ini.svg',
                              //   width: Screen.blockSizeHorizontal * 25,
                              // ),
                              // SizedBox(
                              //   height: Screen.kSize16,
                              // ),
                              // Text(
                              //   'Tidak presensi hari ini',
                              //   style: Styles.kPoppinsSemiBold.copyWith(
                              //       fontSize: Screen.kSize16, color: kWhite),
                              // ),

                              Text(
                                'Presensi Hari Ini',
                                style: Styles.kNunitoSemiBold.copyWith(
                                    color: kWhite, fontSize: Screen.kSize14),
                              ),

                              Text(
                                '07.00',
                                style: Styles.kPoppinsBold.copyWith(
                                    fontSize: Screen.kSize40, color: kWhite),
                              ),
                              Text(
                                "Jum'at, 13 Oktober",
                                style: Styles.kPoppinsMedium.copyWith(
                                    fontSize: Screen.kSize14, color: kWhite),
                              ),
                              SizedBox(
                                height: Screen.kSize12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/tendik/icons/home-presensi-masuk.svg'),
                                          SizedBox(
                                            width: Screen.kSize4,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Masuk',
                                                style: Styles.kNunitoRegular.copyWith(
                                                    fontSize: Screen.kSize12,
                                                    color: kWhite),
                                              ),
                                              Text(
                                                '06.45',
                                                style: Styles.kPoppinsBold.copyWith(
                                                    fontSize: Screen.kSize14,
                                                    color: kWhite),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/tendik/icons/home-presensi-pulang.svg'),
                                          SizedBox(
                                            width: Screen.kSize4,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Pulang',
                                                style: Styles.kNunitoRegular.copyWith(
                                                    fontSize: Screen.kSize12,
                                                    color: kWhite),
                                              ),
                                              Text(
                                                '17.04',
                                                style: Styles.kPoppinsBold.copyWith(
                                                    fontSize: Screen.kSize14,
                                                    color: kWhite),
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
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Screen.kSize24,
            ),
            Container(
              height: Screen.kSize8,
              color: const Color(0xFFF6F7F9),
            ),
            SizedBox(
              height: Screen.kSize24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Screen.kSize24),
              child: Text(
                'Layanan Adisty',
                style:
                    Styles.kPoppinsSemiBold.copyWith(color: kBlack, fontSize: Screen.kSize18),
              ),
            ),
            SizedBox(
              height: Screen.kSize12,
            ),

            GestureDetector(
              child: AdistyService(
                img: 'assets/tendik/images/shift-bulan.png',
                title: 'Jadwal Shift',
                subtitle1: 'Tinjau perkembangan akademik',
                subtitle2: 'mahasiswa.',
                link: const JadwalShiftPage(),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const JadwalShiftPage()));
              },
            ),
            SizedBox(
              height: Screen.kSize16,
            ),
            GestureDetector(
              child: AdistyService(
                img: 'assets/images/agenda.png',
                title: 'Agenda',
                subtitle1: 'Tinjau setiap agenda yang',
                subtitle2: 'Anda ikuti.',
                link: const AgendaPage(),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AgendaPage()));
              },
            ),
            SizedBox(
              height: Screen.kSize16,
            ),
            GestureDetector(
              child: AdistyService(
                img: 'assets/images/tunjangan-beras.png',
                title: 'Tunjangan beras',
                subtitle1: 'Tinjau perkembangan akademik',
                subtitle2: 'mahasiswa.',
                link: const TunjanganPage(),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TunjanganPage()));
              },
            ),
            SizedBox(
              height: Screen.kSize16,
            ),
            GestureDetector(
              child: AdistyService(
                img: 'assets/tendik/images/layanan-cuti.png',
                title: 'Layanan Cuti',
                subtitle1: 'Tinjau perkembangan akademik',
                subtitle2: 'mahasiswa.',
                link: const LayananCutiPage(),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LayananCutiPage()));
              },
            ),

            SizedBox(
              height: Screen.kSize40,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

