import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../helper/app_styles.dart';
import '../../../helper/size_config.dart';
import '../bloc/tunjangan_bloc.dart';

import 'detail_tunjangan_beras.dart';

class TunjanganBeras extends StatelessWidget {
  const TunjanganBeras({super.key});

  @override
  Widget build(BuildContext context) {
    //variabel untuk waktu
    String selectedDate = "";
    String tanggal = DateFormat('M, yyyy').format(DateTime.now());
    final databloc = TunjanganBloc();
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlue,
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kBlue,
        onRefresh: () async {
          databloc.add(GetTunjanganEvent(selectedDate));
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
                    SizeConfig.blockSizeHorizontal! * 2.5,
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
                              cancelWidget: const Text(
                                'Batal',
                                style: TextStyle(
                                  color: kGrey,
                                ),
                              ),
                              confirmWidget: const Text(
                                'Konfirmasi',
                                style: TextStyle(
                                  color: kGrey,
                                ),
                              ),
                              initialDate: DateTime.now(),
                            ).then(
                              (date) {
                                if (date != null) {
                                  selectedDate =
                                      DateFormat('dd MM y').format(date);
                                  tanggal = DateFormat('M, yyyy').format(date);
                                  databloc.add(GetTunjanganEvent(selectedDate));
                                }
                              },
                            );
                          },
                          child: BlocBuilder<TunjanganBloc, TunjanganState>(
                            bloc: databloc,
                            builder: (context, state) {
                              return Text(
                                'Bulan $tanggal',
                                style: kPoppinsMedium.copyWith(
                                  fontSize: kSize14,
                                  color: kNeutral80,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<TunjanganBloc, TunjanganState>(
                      bloc: databloc..add(GetTunjanganEvent(selectedDate)),
                      builder: (context, state) {
                        print(state);
                        if (state is TunjanganLoading) {
                          return const Center();
                        } else if (state is TunjanganTahunLoading) {
                          return const Center();
                        } else if (state is TunjanganLoaded) {
                          var data = state.data;
                          if (data.isNotEmpty) {
                            return Column(
                              children: [
                                Column(
                                  children: data.map(
                                    (item) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailTunjanganBeras(),
                                                ),
                                              );
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
                                                              item.periode,
                                                              style: kPoppinsMedium.copyWith(
                                                                  fontSize:
                                                                      SizeConfig
                                                                              .blockSizeHorizontal! *
                                                                          3.25,
                                                                  color:
                                                                      kBlack),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: SizeConfig
                                                                      .blockSizeHorizontal! *
                                                                  1,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    'assets/icons/tunjangan-beras-location.svg'),
                                                                SizedBox(
                                                                  width: SizeConfig
                                                                          .blockSizeHorizontal! *
                                                                      1,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    item.lokasiAmbil,
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
                                                      color: kNeutral40,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          SizeConfig
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
                                                                color:
                                                                    kNeutral80),
                                                          ),
                                                          SizedBox(
                                                            height: SizeConfig
                                                                    .blockSizeHorizontal! *
                                                                1,
                                                          ),
                                                          Text(
                                                            item.berat,
                                                            style: kPoppinsMedium
                                                                .copyWith(
                                                                    fontSize:
                                                                        SizeConfig.blockSizeHorizontal! *
                                                                            3.75,
                                                                    color:
                                                                        kBlue),
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
                                            height: SizeConfig
                                                    .blockSizeHorizontal! *
                                                2.85,
                                          )
                                        ],
                                      );
                                    },
                                  ).toList(),
                                ),
                                SizedBox(
                                  height:
                                      SizeConfig.blockSizeHorizontal! * 1.87,
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight! * .2,
                                )
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                SizedBox(
                                  height: kSize32,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/libur-jadwal-perkuliahan.svg'),
                                SizedBox(
                                  height: kSize24,
                                ),
                                Text(
                                  'Tidak Ada Tunjangan',
                                  style: kPoppinsSemiBold.copyWith(
                                      fontSize: 18, color: kBlack),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 0.5,
                                ),
                                Text(
                                  'Tidak ada data tunjangan untuk\n ditampilkan',
                                  textAlign: TextAlign.center,
                                  style: kNunitoRegular.copyWith(
                                      fontSize: 14, color: kNeutral90),
                                ),
                                SizedBox(
                                  height: kSize40,
                                )
                              ],
                            );
                          }
                        } else if (state is TunjanganError) {
                          return const Center();
                        } else {
                          return const Center();
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
