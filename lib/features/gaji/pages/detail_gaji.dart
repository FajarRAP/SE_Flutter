import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants_finals.dart';
import '../../../helper/size_config.dart';
import '../bloc/gaji_bloc.dart';
import '../models/detail_gaji_model.dart';

class DetailGaji extends StatefulWidget {
  final String gaji;
  final String waktu;
  final String bulanId;
  const DetailGaji(
      {Key? key,
      required this.gaji,
      required this.waktu,
      required this.bulanId})
      : super(key: key);

  @override
  State<DetailGaji> createState() => _DetailGajiState();
}

class _DetailGajiState extends State<DetailGaji> {
  bool showAll = false;

  List gaji = ['Pemasukan', 'Potongan'];
  int currentGaji = 0;
  List<DataDetailGaji> listPemasukan = [];
  List<DataDetailGaji> listPotongan = [];

  @override
  Widget build(BuildContext context) {
    ////nanti ini dipake di parameter endpoint buat APInya
    // print('Bulan ID : ${widget.bulanId}');
    String infoGaji = widget.gaji;
    String infoWaktu = widget.waktu;
    GajiBloc detailGajiBloc = GajiBloc();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            colorFilter: const ColorFilter.mode(kBlue, BlendMode.srcIn),
            fit: BoxFit.scaleDown,
            width: 24,
            height: 24,
          ),
        ),
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Detail Gaji',
            style: Styles.kPoppinsMedium.copyWith(
              fontSize: Screen.kSize16,
              color: kBlack,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Screen.kSize32),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize20,
              ),
              child: Container(
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: Screen.kSize20,
                  vertical: Screen.kSize16,
                ),
                decoration: ShapeDecoration(
                  color: kBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      infoGaji,
                      style: Styles.kPoppinsSemiBold.copyWith(
                        fontSize: Screen.kSize28,
                        color: kWhite,
                      ),
                    ),
                    SizedBox(height: Screen.kSize4),
                    Text(
                      infoWaktu,
                      style: Styles.kNunitoRegular.copyWith(
                        fontSize: Screen.kSize14,
                        color: kNeutral20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Screen.kSize40),
            Container(
              height: Screen.kSize8,
              color: const Color(0xFFEEF2F3),
            ),
            SizedBox(height: Screen.kSize24),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize20,
              ),
              child: SizedBox(
                height: 32,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 12,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: gaji.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            currentGaji = index;
                          },
                        );
                      },
                      child: Container(
                        height: Screen.kSize32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: currentGaji == index ? kOrange : kLightGrey),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Center(
                          child: Text(
                            gaji[index],
                            style: Styles.kPoppinsRegular.copyWith(
                                color:
                                    currentGaji == index ? kWhite : kNeutral60,
                                fontSize: Screen.kSize12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Screen.kSize24,
            ),
            BlocBuilder<GajiBloc, GajiState>(
              bloc: detailGajiBloc..add(GetDetailGajiEvent()),
              builder: (context, state) {
                if (state is DetailGajiLoading) {
                  return Container(
                    height: SizeConfig.screenHeight,
                    color: kWhite,
                  );
                } else if (state is DetailGajiLoaded) {
                  if (listPemasukan.isEmpty || listPotongan.isEmpty) {
                    var data = state.data.data;
                    listPemasukan.clear();
                    listPotongan.clear();
                    for (var item in data) {
                      if (item.tipe == 'Pemasukan') {
                        listPemasukan.add(item);
                      } else if (item.tipe == 'Potongan') {
                        listPotongan.add(item);
                      }
                    }
                  }
                  return Column(
                    children: [
                      if (currentGaji == 0)
                        Column(
                          children: [
                            Column(
                                children: listPemasukan.map(
                              (e) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: Screen.kSize20),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Screen.kSize16,
                                            vertical: Screen.kSize16),
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
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/pemasukan.svg',
                                              width: Screen.kSize40,
                                            ),
                                            SizedBox(width: Screen.kSize16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e.nominal,
                                                  style:
                                                      Styles.kPoppinsMedium.copyWith(
                                                          fontSize: Screen.kSize18,
                                                          color: kBlack),
                                                ),
                                                Text(
                                                  e.keterangan,
                                                  style:
                                                      Styles.kNunitoRegular.copyWith(
                                                          fontSize: Screen.kSize14,
                                                          color: kNeutral90),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: Screen.kSize12,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ).toList()),
                            SizedBox(
                              height: Screen.kSize8,
                            ),
                          ],
                        ),
                      if (currentGaji == 1)
                        Column(
                          children: [
                            Column(
                                children: listPotongan.map(
                              (e) {
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: Screen.kSize20),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Screen.kSize16,
                                            vertical: Screen.kSize16),
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
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/potongan.svg',
                                              width: Screen.kSize40,
                                            ),
                                            SizedBox(width: Screen.kSize16),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  e.nominal,
                                                  style:
                                                      Styles.kPoppinsMedium.copyWith(
                                                          fontSize: Screen.kSize18,
                                                          color: kBlack),
                                                ),
                                                Text(
                                                  e.keterangan,
                                                  style:
                                                      Styles.kNunitoRegular.copyWith(
                                                          fontSize: Screen.kSize14,
                                                          color: kNeutral90),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: Screen.kSize12,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ).toList()),
                            SizedBox(
                              height: Screen.kSize8,
                            ),
                          ],
                        ),
                    ],
                  );
                } else if (state is DetailGajiError) {
                  return Container(
                    height: SizeConfig.screenHeight,
                    color: const Color((0xFFF6F7F9)),
                  );
                } else {
                  return Container(
                    height: SizeConfig.screenHeight,
                    color: const Color((0xFFF6F7F9)),
                  );
                }
              },
            ),
            SizedBox(
              height: Screen.kSize40,
            )
          ],
        ),
      ),
    );
  }
}
