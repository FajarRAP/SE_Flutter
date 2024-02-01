import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../bloc/gaji_bloc.dart';
import 'detail_gaji.dart';

class InformasiGaji extends StatefulWidget {
  InformasiGaji({super.key});

  @override
  State<InformasiGaji> createState() => _InformasiGajiState();
}

class _InformasiGajiState extends State<InformasiGaji> {
  bool showAll = false;

  List gaji = [];

  @override
  Widget build(BuildContext context) {
    final gajiBloc = GajiBloc();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F9),
      appBar: AppBar(
        elevation: 4,
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
        shadowColor: const Color(0x25293241),
        backgroundColor: kWhite,
        title: SizedBox(
          child: Text(
            'Informasi Gaji',
            style: kPoppinsMedium.copyWith(fontSize: kSize16, color: kBlack),
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        backgroundColor: kWhite,
        color: kBlue,
        onRefresh: () async {
          gajiBloc.add(GetGajiEvent());
        },
        child: SingleChildScrollView(
          child: BlocBuilder<GajiBloc, GajiState>(
            bloc: gajiBloc..add(GetGajiEvent()),
            builder: (context, state) {
              if (state is GajiLoading) {
                return Container(
                  height: SizeConfig.screenHeight,
                  color: const Color((0xFFF6F7F9)),
                );
              } else if (state is GajiLoaded) {
                var data = state.data.data;
                if (data.isNotEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: kSize32,
                      ),
                      Column(
                          children: data.map(
                        (item) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: kSize20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    //NAVIGASI ANTAR PAGE
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailGaji(
                                            gaji: item.nominal,
                                            waktu: item.bulan,
                                            bulanId: item.bulanId,
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kSize16, vertical: kSize16),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
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
                                          'assets/icons/gaji.svg',
                                          width: kSize40,
                                        ),
                                        SizedBox(width: kSize16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.nominal,
                                              style: kPoppinsMedium.copyWith(
                                                  fontSize: kSize18,
                                                  color: kBlack),
                                            ),
                                            Text(
                                              item.bulan,
                                              style: kNunitoRegular.copyWith(
                                                  fontSize: kSize14,
                                                  color: kNeutral90),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: kSize12,
                                )
                              ],
                            ),
                          );
                        },
                      ).toList()),
                      SizedBox(
                        height: kSize8,
                      ),
                      SizedBox(
                        height: kSize40,
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Column(
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
                          'Tidak ada gaji',
                          style: kPoppinsSemiBold.copyWith(
                              fontSize: 18, color: kBlack),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 0.5,
                        ),
                        Text(
                          'Tidak dapat menampilkan daftar \n gaji',
                          textAlign: TextAlign.center,
                          style: kNunitoRegular.copyWith(
                              fontSize: 14, color: kNeutral90),
                        ),
                        SizedBox(
                          height: kSize40,
                        )
                      ],
                    ),
                  );
                }
              } else if (state is GajiError) {
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
        ),
      ),
    );
  }
}
