import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konsumsi_api_agenda/shift/bloc/shift_bloc.dart';
import 'package:konsumsi_api_agenda/shift/pages/detail_jadwal_shift.dart';
import '../models/shift_model.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JadwalShift extends StatefulWidget {
  const JadwalShift({super.key});

  @override
  State<JadwalShift> createState() => _JadwalShiftState();
}

class _JadwalShiftState extends State<JadwalShift> {
  List<JadwalShiftKerja> data = [];

  @override
  Widget build(BuildContext context) {
    final jadwalShiftBloc = ShiftBloc();
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kBlue,
        onRefresh: () async {
          jadwalShiftBloc.add(GetJadwalShiftEvent());
          print("Berhasil euy");
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                vertical: SizeConfig.blockSizeHorizontal! * 3.75,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! *
                        2, // Sesuaikan jarak antara ikon dan teks
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Jadwal Shift',
                        style: kPoppinsSemiBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4.675,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  //background putih belakang item row
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32)),
              child: Container(
                width: SizeConfig.screenWidth,
                height: MediaQuery.sizeOf(context).height,
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.blockSizeHorizontal! * 4.675,
                    SizeConfig.blockSizeHorizontal! * 3.75,
                    SizeConfig.blockSizeHorizontal! * 4.675,
                    SizeConfig.blockSizeHorizontal! * 7.5),
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    BlocBuilder<ShiftBloc, ShiftState>(
                      bloc: jadwalShiftBloc..add(GetJadwalShiftEvent()),
                      builder: (context, state) {
                        print("$state");
                        if (state is JadwalShiftLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: kBlue,
                            ),
                          );
                        } else if (state is JadwalShiftLoaded) {
                          final List<DataJadwalShiftKerja> data =
                              state.data.data;
                          //bisa seperti ini
                          // var zzz = state.data.data;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal! * 2.85,
                                ),
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
                                            horizontal: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.85,
                                            vertical:
                                                SizeConfig.blockSizeVertical! *
                                                    0.85,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                'https://pixlok.com/wp-content/uploads/2022/02/Profile-Icon-SVG-09856789.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                              SizedBox(
                                                width: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    4.00,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Lalu Ramadhan',
                                                    style: kPoppinsRegular
                                                        .copyWith(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          3.15,
                                                      color: kBlack,
                                                    ),
                                                  ),
                                                  Text(
                                                    '9817293112',
                                                    style: kPoppinsRegular
                                                        .copyWith(
                                                      fontSize: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          3.15,
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
                                            horizontal: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.85,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Unit Kerja    :',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3.15,
                                                  color: kNeutral70,
                                                ),
                                              ),
                                              SizedBox(
                                                width: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    3.00,
                                              ),
                                              Text(
                                                'Parkir',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3.15,
                                                  color: kBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.85,
                                            vertical:
                                                SizeConfig.blockSizeVertical! *
                                                    1.85,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Posisi           :',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3.15,
                                                  color: kNeutral70,
                                                ),
                                              ),
                                              SizedBox(
                                                width: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    3.00,
                                              ),
                                              Text(
                                                'Preman',
                                                style: kPoppinsMedium.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      3.15,
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
                                height: SizeConfig.blockSizeVertical! * 2,
                              ),
                              Divider(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal! * 2.85,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Januari 2024',
                                        style: kPoppinsSemiBold.copyWith(
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3.00,
                                            color: kNeutral60),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                  children: data.map(
                                (item) {
                                  //ITEM ROWS
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   PageTransition(
                                          //     duration: const Duration(
                                          //         milliseconds: 100),
                                          //     child: const DetailTunjanganBeras(),
                                          //     type: PageTransitionType.fade,
                                          //   ),
                                          // );
                                          //SEMENTARA
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPageJadwalShift(),
                                              ));
                                        },
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
                                          child: IntrinsicHeight(
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            2.85,
                                                        vertical: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            0.85),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          //JADWAL SHIFT
                                                          item.namaShift,
                                                          style: kPoppinsMedium
                                                              .copyWith(
                                                                  fontSize:
                                                                      SizeConfig
                                                                              .blockSizeHorizontal! *
                                                                          3.25,
                                                                  color:
                                                                      kBlack),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              1,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .all(SizeConfig
                                                                      .blockSizeHorizontal! *
                                                                  2.85),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              //WAKTU SHIFT
                                                              Text(
                                                                'Pukul',
                                                                style:
                                                                    kPoppinsRegular
                                                                        .copyWith(
                                                                  fontSize:
                                                                      SizeConfig
                                                                              .blockSizeHorizontal! *
                                                                          3.35,
                                                                  color:
                                                                      kNeutral80,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: SizeConfig
                                                                        .blockSizeHorizontal! *
                                                                    2.1,
                                                              ),
                                                              Text(
                                                                item.waktuShift,
                                                                style: kPoppinsMedium.copyWith(
                                                                    fontSize:
                                                                        SizeConfig.blockSizeHorizontal! *
                                                                            3.35,
                                                                    color:
                                                                        kBlue),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: SizeConfig
                                                              .blockSizeHorizontal! *
                                                          2.85),
                                                  child: const Divider(
                                                    height: 1,
                                                    color: kNeutral40,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        2.85,
                                                    vertical: SizeConfig
                                                            .blockSizeHorizontal! *
                                                        2.95,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      //LOKASI SHIFT
                                                      Text(
                                                        item.lokasiShift,
                                                        style: kPoppinsMedium.copyWith(
                                                            fontSize: SizeConfig
                                                                    .blockSizeHorizontal! *
                                                                3.25,
                                                            color: kNeutral80),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeHorizontal! *
                                                2.85,
                                      ),
                                    ],
                                  );
                                },
                              ).toList()),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 1.87,
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * .2,
                              )
                            ],
                          );
                        } else if (state is JadwalShiftError) {
                          return Text(state.errorMsg);
                        } else {
                          return const Center(
                            child: Text('Gagal'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
