// import 'package:adisty_mobile_dosen/screens/09-tunjangan_beras/detail_tunjangan_beras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../bloc/tunjangan/tunjangan_bloc.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../../models/tunjangan/tunjangan_model.dart';
import '../../models/tunjangan/tunjangan_tahun_model.dart';
import 'detail_tunjangan_beras.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:page_transition/page_transition.dart';

class TunjanganBeras extends StatefulWidget {
  const TunjanganBeras({super.key});

  @override
  State<TunjanganBeras> createState() => _TunjanganBerasState();
}

class _TunjanganBerasState extends State<TunjanganBeras> {
  bool showAll = false;
  //variabel untuk waktu
  late String selectedDate;
  List<DataTunjangan> mahasiswa = [];

  @override
  Widget build(BuildContext context) {
    final databloc = TunjanganBloc();
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kBlue,
        onRefresh: ()async {
          databloc.add(GetTunjanganEvent());
          print("Berhasil euy");
        },
        child: ListView(
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
                    'Tunjangan Beras',
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
                  //background putih belakang item row
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32)),
              child: Container(
                width: SizeConfig.screenWidth,
                height: MediaQuery.sizeOf(context).height,
                padding: EdgeInsets.fromLTRB(
                    SizeConfig.blockSizeHorizontal! * 4.675,
                    SizeConfig.blockSizeHorizontal! * 7.5,
                    SizeConfig.blockSizeHorizontal! * 4.675,
                    SizeConfig.blockSizeHorizontal! * 7.5),
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            showMonthPicker(
                                    context: context,
                                    headerColor: kBlue,
                                    headerTextColor: kWhite,
                                    selectedMonthBackgroundColor: kBlue,
                                    unselectedMonthTextColor: kBlue,
                                    roundedCornersRadius: 12,
                                    cancelWidget: Text(
                                      'Batal',
                                      style: TextStyle(
                                        color: kGrey,
                                      ),
                                    ),
                                    confirmWidget: Text(
                                      'Konfirmasi',
                                      style: TextStyle(
                                        color: kGrey,
                                      ),
                                    ),
                                    initialDate: DateTime.now())
                                .then(
                              (date) {
                                if (date != null) {
                                  selectedDate = date.toString();
                                  print(selectedDate);
                                  databloc.add(
                                    GetDetailTunjanganBerdasarkanTahunEvent(
                                        selectedDate),
                                  );
                                }
                              },
                            );
                          },
                          child: Text(
                            'Kalender',
                            style: kPoppinsSemiBold.copyWith(
                                color: kBlue,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 3.675),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<TunjanganBloc, TunjanganState>(
                      bloc: databloc..add(GetTunjanganEvent()),
                      builder: (context, state) {
                        if (state is TunjanganLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: kBlue,
                            ),
                          );
                        } else if (state is TunjanganTahunLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: kBlue,
                            ),
                          );
                        } else if (state is TunjanganLoaded) {
                          print(state.data);
                          final List<DataTunjangan> data =
                              (state as TunjanganLoaded).data;
                          return Column(
                            children: [
                              Column(
                                  children: data.map(
                                (mhs) {
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
                                                    DetailTunjanganBeras(),
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
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            2.85,
                                                        vertical: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            2.85),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          //TANGGAL
                                                          mhs.periode,
                                                          style: kPoppinsMedium.copyWith(
                                                              fontSize: SizeConfig
                                                                      .blockSizeHorizontal! *
                                                                  3.25,
                                                              color: kBlack),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              1,
                                                        ),
                                                        Row(
                                                          children: [
                                                            // SvgPicture.asset(
                                                            //     'assets/icons/tunjangan-beras-location.svg'),
                                                            SizedBox(
                                                              width: SizeConfig
                                                                      .blockSizeHorizontal! *
                                                                  1,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                //LOKASI
                                                                mhs.lokasiAmbil,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: kPoppinsRegular.copyWith(
                                                                    fontSize:
                                                                        SizeConfig
                                                                                .blockSizeHorizontal! *
                                                                            2.85,
                                                                    color:
                                                                        kNeutral80),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const VerticalDivider(
                                                  width: 1,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(SizeConfig
                                                          .blockSizeHorizontal! *
                                                      2.85),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Beras',
                                                        style: kPoppinsRegular.copyWith(
                                                            fontSize: SizeConfig
                                                                    .blockSizeHorizontal! *
                                                                2.85,
                                                            color: kNeutral80),
                                                      ),
                                                      SizedBox(
                                                        height: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            1,
                                                      ),
                                                      Text(
                                                        //BERAT
                                                        mhs.berat,
                                                        style: kPoppinsMedium.copyWith(
                                                            fontSize: SizeConfig
                                                                    .blockSizeHorizontal! *
                                                                3.75,
                                                            color: kBlue),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.blockSizeHorizontal! *
                                            2.85,
                                      )
                                    ],
                                  );
                                },
                              ).toList()),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 1.87,
                              ),
                              TextButton(
                                onPressed: () {
                                  print("ShowAll before: $showAll");
                                  setState(() {
                                    showAll = !showAll;
                                  });
                                  print("ShowAll after: $showAll");
                                },
                                child: Text(
                                  showAll ? 'Tampilkan sedikit' : 'Lihat semua',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3.25,
                                      color: kBlue),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * .2,
                              )
                            ],
                          );
                        } else if (state is TunjanganTahunLoaded) {
                          final List<DataTunjanganTahun> data = state.data.data;
                          return Column(
                            children: [
                              Column(
                                children: data.map(
                                  (mhs) {
                                    // Di sini kamu dapat mengakses properti periode
                                    print("SATT ${mhs.periode}");
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
                                                      DetailTunjanganBeras(),
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
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              2.85,
                                                          vertical: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              2.85),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            //TANGGAL
                                                            mhs.periode,
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
                                                          Row(
                                                            children: [
                                                              // SvgPicture.asset(
                                                              //     'assets/icons/tunjangan-beras-location.svg'),
                                                              SizedBox(
                                                                width: SizeConfig
                                                                        .blockSizeHorizontal! *
                                                                    1,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  //LOKASI
                                                                  mhs.lokasiAmbil,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: kPoppinsRegular.copyWith(
                                                                      fontSize:
                                                                          SizeConfig.blockSizeHorizontal! *
                                                                              2.85,
                                                                      color:
                                                                          kNeutral80),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const VerticalDivider(
                                                    width: 1,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(SizeConfig
                                                            .blockSizeHorizontal! *
                                                        2.85),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Beras',
                                                          style: kPoppinsRegular.copyWith(
                                                              fontSize: SizeConfig
                                                                      .blockSizeHorizontal! *
                                                                  2.85,
                                                              color: kNeutral80),
                                                        ),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeHorizontal! *
                                                              1,
                                                        ),
                                                        Text(
                                                          //BERAT
                                                          mhs.berat,
                                                          style: kPoppinsMedium.copyWith(
                                                              fontSize: SizeConfig
                                                                      .blockSizeHorizontal! *
                                                                  3.75,
                                                              color: kBlue),
                                                        )
                                                      ],
                                                    ),
                                                  ),
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
                                ).toList(),
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeHorizontal! * 1.87,
                              ),
                              // TextButton(
                              //   onPressed: () {
                              //     setState(
                              //       () {
                              //         showAll = !showAll;
                              //         print("ShowAll after: $showAll");
                              //       },
                              //     );
                              //   },
                              //   child: Text(
                              //     showAll ? 'Tampilkan sedikit' : 'Lihat semua',
                              //     style: kPoppinsMedium.copyWith(
                              //         fontSize:
                              //             SizeConfig.blockSizeHorizontal! * 3.25,
                              //         color: kBlue),
                              //   ),
                              // ),
                              SizedBox(
                                height: SizeConfig.screenHeight! * .2,
                              )
                            ],
                          );
                        } else if (state is TunjanganError) {
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
