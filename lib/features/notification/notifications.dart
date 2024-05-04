// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/constants_finals.dart';


class NotifikasiKosong extends StatelessWidget {
  const NotifikasiKosong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
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
        title: SizedBox(
          child: Text(
            'Notifikasi',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  duration: const Duration(milliseconds: 100),
                  child: const Notifikasi(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/notif-kosong.svg'),
                SizedBox(
                  height: Screen.blockSizeHorizontal * 18.7,
                ),
                Text(
                  'Notifikasi kosong',
                  style:
                      Styles.kPoppinsBold.copyWith(fontSize: Screen.kSize24, color: kBlack),
                ),
                SizedBox(
                  height: Screen.kSize16,
                ),
                SizedBox(
                  width: Screen.width * 0.7,
                  child: Text(
                    'saat ini Anda belum menerima pemberitahuan apa pun.',
                    textAlign: TextAlign.center,
                    style: Styles.kNunitoRegular.copyWith(
                        fontSize: Screen.kSize16, color: kNeutral70),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
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
        title: SizedBox(
          child: Text(
            'Notifikasi',
            style: Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     duration: const Duration(milliseconds: 100),
              //     child: DetailNotifikasi(),
              //     type: PageTransitionType.fade,
              //   ),
              // );
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(Screen.kSize20),
              decoration: const BoxDecoration(
                color: kWhite,
                border: Border(
                  bottom: BorderSide(width: 1, color: kLightGrey),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/tendik/icons/notifikasi-agenda.svg'),
                        SizedBox(width: Screen.kSize12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Agenda',
                                style: Styles.kPoppinsSemiBold.copyWith(
                                    color: kBlack, fontSize: Screen.kSize14),
                              ),
                              SizedBox(
                                height: Screen.kSize4,
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been asasasas ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.kNunitoRegular.copyWith(
                                    color: kNeutral70,
                                    fontFamily: 'Nunito',
                                    fontSize: Screen.kSize12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '09:45',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: Screen.kSize12,
                        color: kNeutral70),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     duration: const Duration(milliseconds: 100),
              //     child: DetailNotifikasi(),
              //     type: PageTransitionType.fade,
              //   ),
              // );
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(Screen.kSize20),
              decoration: const BoxDecoration(
                color: kWhite,
                border: Border(
                  bottom: BorderSide(width: 1, color: kLightGrey),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/tendik/icons/notifikasi-pengisian-survei.svg'),
                        SizedBox(width: Screen.kSize12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pengisian survei',
                                style: Styles.kPoppinsSemiBold.copyWith(
                                    color: kBlack, fontSize: Screen.kSize14),
                              ),
                              SizedBox(
                                height: Screen.kSize4,
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been asasasas ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.kNunitoRegular.copyWith(
                                    color: kNeutral70,
                                    fontFamily: 'Nunito',
                                    fontSize: Screen.kSize12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '09:45',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: Screen.kSize12,
                        color: kNeutral70),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     duration: const Duration(milliseconds: 100),
              //     child: DetailNotifikasi(),
              //     type: PageTransitionType.fade,
              //   ),
              // );
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(Screen.kSize20),
              decoration: const BoxDecoration(
                color: kWhite,
                border: Border(
                  bottom: BorderSide(width: 1, color: kLightGrey),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            'assets/tendik/icons/notifikasi-riwayat-pegawai.svg'),
                        SizedBox(width: Screen.kSize12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Riwayat kepegawaian',
                                style: Styles.kPoppinsSemiBold.copyWith(
                                    color: kBlack, fontSize: Screen.kSize14),
                              ),
                              SizedBox(
                                height: Screen.kSize4,
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been asasasas ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.kNunitoRegular.copyWith(
                                    color: kNeutral70,
                                    fontFamily: 'Nunito',
                                    fontSize: Screen.kSize12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '09:45',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: Screen.kSize12,
                        color: kNeutral70),
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
