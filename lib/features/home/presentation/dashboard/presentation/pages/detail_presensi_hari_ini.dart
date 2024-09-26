// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants_finals.dart';
import '../cubit/detail_presensi_today_cubit.dart';

class DetailPresensiHariIni extends StatefulWidget {
  const DetailPresensiHariIni({super.key});

  @override
  State<DetailPresensiHariIni> createState() => _DetailPresensiHariIniState();
}

class _DetailPresensiHariIniState extends State<DetailPresensiHariIni> {
  @override
  Widget build(BuildContext context) {
    final DetailPresensiTodayCubit data =
        context.read<DetailPresensiTodayCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: ListView(
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
                  'Presensi Tendik',
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Screen.kSize32),
                topRight: Radius.circular(Screen.kSize32)),
            child: Container(
              width: Screen.width,
              height: Screen.height,
              padding: EdgeInsets.symmetric(
                  vertical: Screen.kSize32, horizontal: Screen.kSize20),
              color: const Color(0xFFF6F7F9),
              child: Column(
                children: [
                  Container(
                    width: Screen.width,
                    padding: EdgeInsets.only(
                        left: Screen.kSize16,
                        top: Screen.kSize16,
                        right: Screen.kSize32,
                        bottom: Screen.kSize16),
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
                    child: BlocBuilder<DetailPresensiTodayCubit,
                        DetailPresensiTodayState>(
                      bloc: data..getDetailPresensiToday(),
                      builder: (context, state) {
                        if (state is DetailPresensiTodayLoading) {
                          return const Center();
                        } else if (state is DetailPresensiTodayLoaded) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/tendik/icons/presensi-tanggal.svg',
                                    width: Screen.kSize40,
                                  ),
                                  SizedBox(
                                    width: Screen.kSize16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal',
                                          style: Styles.kPoppinsRegular
                                              .copyWith(
                                                  fontSize: Screen.kSize14,
                                                  color: kNeutral80),
                                        ),
                                        Text(
                                          state.data.tanggal,
                                          style: Styles.kNunitoSemiBold
                                              .copyWith(
                                                  fontSize: Screen.kSize16,
                                                  color: kBlack),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: Screen.kSize16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/tendik/icons/presensi-status.svg',
                                    width: Screen.kSize40,
                                  ),
                                  SizedBox(
                                    width: Screen.kSize16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Status Presensi',
                                          style: Styles.kPoppinsRegular
                                              .copyWith(
                                                  fontSize: Screen.kSize14,
                                                  color: kNeutral80),
                                        ),
                                        Text(
                                          state.data.statusPresensi,
                                          style: Styles.kNunitoSemiBold
                                              .copyWith(
                                                  fontSize: Screen.kSize16,
                                                  color: kBlack),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: Screen.kSize16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/tendik/icons/presensi-lokasi.svg',
                                    width: Screen.kSize40,
                                  ),
                                  SizedBox(
                                    width: Screen.kSize16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lokasi',
                                          style: Styles.kPoppinsRegular
                                              .copyWith(
                                                  fontSize: Screen.kSize14,
                                                  color: kNeutral80),
                                        ),
                                        Text(
                                          '${state.data.lokasiKampus}, ${state.data.lokasiGedung}',
                                          style: Styles.kNunitoSemiBold
                                              .copyWith(
                                                  fontSize: Screen.kSize16,
                                                  color: kBlack),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: Screen.kSize16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/tendik/icons/presensi-biaya-perjalanan.svg',
                                    width: Screen.kSize40,
                                  ),
                                  SizedBox(
                                    width: Screen.kSize16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Insentif',
                                          style: Styles.kPoppinsRegular
                                              .copyWith(
                                                  fontSize: Screen.kSize14,
                                                  color: kNeutral80),
                                        ),
                                        Text(
                                          state.data.nominalInsentif,
                                          style: Styles.kNunitoSemiBold
                                              .copyWith(
                                                  fontSize: Screen.kSize16,
                                                  color: kBlack),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: Screen.kSize16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/tendik/icons/presensi-masuk.svg',
                                    width: Screen.kSize40,
                                  ),
                                  SizedBox(
                                    width: Screen.kSize16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jam Masuk',
                                          style: Styles.kPoppinsRegular
                                              .copyWith(
                                                  fontSize: Screen.kSize14,
                                                  color: kNeutral80),
                                        ),
                                        Text(
                                          state.data.jamMasuk,
                                          style: Styles.kNunitoSemiBold
                                              .copyWith(
                                                  fontSize: Screen.kSize16,
                                                  color: kBlack),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: Screen.kSize16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/tendik/icons/presensi-keluar.svg',
                                    width: Screen.kSize40,
                                  ),
                                  SizedBox(
                                    width: Screen.kSize16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jam Pulang',
                                          style: Styles.kPoppinsRegular
                                              .copyWith(
                                                  fontSize: Screen.kSize14,
                                                  color: kNeutral80),
                                        ),
                                        Text(
                                          state.data.jamPulang,
                                          style: Styles.kNunitoSemiBold
                                              .copyWith(
                                                  fontSize: Screen.kSize16,
                                                  color: kBlack),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              SizedBox(
                                height: Screen.kSize16,
                              ),
                            ],
                          );
                        } else if (state is DetailPresensiTodayError) {
                          return const Center();
                        }
                        return const Center();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
