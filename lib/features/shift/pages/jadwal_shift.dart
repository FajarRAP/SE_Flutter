import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants_finals.dart';
import '../bloc/shift_bloc.dart';

class JadwalShift extends StatefulWidget {
  const JadwalShift({super.key});

  @override
  State<JadwalShift> createState() => _JadwalShiftState();
}

class _JadwalShiftState extends State<JadwalShift> {
  List days = ['Senin', 'Selasa', 'Rabu', 'Kamis', "Jum'at", 'Sabtu'];
  int currentDay = 0;

  @override
  Widget build(BuildContext context) {
    final jadwalShiftBloc = ShiftBloc();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        color: kBlue,
        backgroundColor: kWhite,
        onRefresh: () async {
          jadwalShiftBloc.add(GetJadwalShiftEvent());
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Screen.kSize20, vertical: Screen.kSize16),
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
                    'Jadwal Shift',
                    style: Styles.kPoppinsSemiBold
                        .copyWith(color: kWhite, fontSize: Screen.kSize20),
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
                padding: EdgeInsets.symmetric(vertical: Screen.kSize20),
                color: const Color(0xFFF6F7F9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: kWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
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
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Screen.kSize12,
                                  vertical: Screen.kSize4,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/circled_user_female.svg'),
                                    SizedBox(
                                      width: Screen.kSize18,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Lalu Ramadhan',
                                          style: Styles.kPoppinsMedium.copyWith(
                                            fontSize: Screen.kSize14,
                                            color: kBlack,
                                          ),
                                        ),
                                        Text(
                                          '9817293112',
                                          style:
                                              Styles.kPoppinsRegular.copyWith(
                                            fontSize: Screen.kSize14,
                                            color: kBlue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Screen.kSize12,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Unit Kerja    :',
                                      style: Styles.kPoppinsMedium.copyWith(
                                        fontSize: Screen.kSize14,
                                        color: kNeutral70,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Screen.kSize14,
                                    ),
                                    Text(
                                      //nanti diisi sama data pengguna
                                      'Keamanan',
                                      style: Styles.kPoppinsMedium.copyWith(
                                        fontSize: Screen.kSize14,
                                        color: kBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Screen.kSize12,
                                  vertical: Screen.kSize8,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Posisi           :',
                                      style: Styles.kPoppinsMedium.copyWith(
                                        fontSize: Screen.kSize14,
                                        color: kNeutral70,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Screen.kSize14,
                                    ),
                                    Text(
                                      //nanti diisi
                                      'Satpam',
                                      style: Styles.kPoppinsMedium.copyWith(
                                        fontSize: Screen.kSize14,
                                        color: kBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screen.kSize12,
                    ),
                    SizedBox(
                      height: 32,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 12,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: Screen.kSize20),
                        scrollDirection: Axis.horizontal,
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentDay = index;
                              });
                            },
                            child: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: currentDay == index
                                    ? bgButton
                                    : kLightGrey,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Center(
                                child: Text(
                                  days[index],
                                  style: Styles.kPoppinsRegular.copyWith(
                                    color: currentDay == index ? kWhite : kGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Screen.kSize24,
                    ),
                    BlocBuilder(
                      bloc: jadwalShiftBloc..add(GetJadwalShiftEvent()),
                      builder: (context, state) {
                        if (state is JadwalShiftLoading) {
                          return const Center();
                        } else if (state is JadwalShiftLoaded) {
                          var shift = state.data.data;
                          if (shift.isNotEmpty) {
                            return Column(
                              children: shift.map((e) {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  e.namaShift,
                                                  style: Styles.kPoppinsSemiBold
                                                      .copyWith(
                                                          fontSize:
                                                              Screen.kSize14,
                                                          color: kBlack),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Pukul',
                                                      style: Styles
                                                          .kPoppinsRegular
                                                          .copyWith(
                                                              fontSize: Screen
                                                                  .kSize14,
                                                              color:
                                                                  kNeutral90),
                                                    ),
                                                    SizedBox(
                                                      width: Screen.kSize4,
                                                    ),
                                                    Text(
                                                      e.waktuShift,
                                                      style: Styles
                                                          .kPoppinsMedium
                                                          .copyWith(
                                                              fontSize: Screen
                                                                  .kSize14,
                                                              color: kBlue),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Divider(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/icons/tunjangan-beras-location.svg'),
                                                    SizedBox(
                                                      width: Screen.kSize4,
                                                    ),
                                                    Text(
                                                      e.lokasiShift,
                                                      style: Styles
                                                          .kPoppinsMedium
                                                          .copyWith(
                                                              fontSize: Screen
                                                                  .kSize14,
                                                              color:
                                                                  kNeutral90),
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
                              }).toList(),
                            );
                          } else {
                            return Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Screen.kSize32,
                                  ),
                                  SvgPicture.asset(
                                      'assets/icons/libur-jadwal-perkuliahan.svg'),
                                  SizedBox(
                                    height: Screen.kSize24,
                                  ),
                                  Text(
                                    'Tidak ada jadwal shift',
                                    style: Styles.kPoppinsSemiBold
                                        .copyWith(fontSize: 18, color: kBlack),
                                  ),
                                  SizedBox(height: Screen.kSize4),
                                  Text(
                                    'Hari ini anda tidak memiliki jadwal\n shift',
                                    textAlign: TextAlign.center,
                                    style: Styles.kNunitoRegular.copyWith(
                                        fontSize: 14, color: kNeutral90),
                                  ),
                                  SizedBox(
                                    height: Screen.kSize40,
                                  )
                                ],
                              ),
                            );
                          }
                        } else if (state is JadwalShiftError) {
                          return const Center();
                        } else {
                          return const Center();
                        }
                      },
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
            borderRadius: BorderRadius.circular(
                Screen.kSize24), // Sesuaikan nilai border radius
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
                style: Styles.kPoppinsSemiBold
                    .copyWith(fontSize: Screen.kSize20, color: kBlack),
              ),
              SizedBox(
                height: Screen.kSize40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B86C4),
                    fixedSize: Size(
                      Screen.width,
                      56,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64),
                    )),
                child: Text(
                  'Oke',
                  style:
                      Styles.kPoppinsMedium.copyWith(fontSize: Screen.kSize16),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
