import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:konsumsi_api_agenda/gaji/bloc/gaji_bloc.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../helper/app_styles.dart";
import "../../helper/size_config.dart";

class DetailInformasiGaji extends StatefulWidget {
  final String gaji;
  final String waktu;

  const DetailInformasiGaji({
    Key? key,
    required this.gaji,
    required this.waktu,
  }) : super(key: key);

  @override
  State<DetailInformasiGaji> createState() => _DetailInformasiGajiState();
}

class _DetailInformasiGajiState extends State<DetailInformasiGaji> {

  @override
  Widget build(BuildContext context) {
// Gunakan widget.gaji dan widget.waktu untuk mengakses nilai yang dikirim
    String gaji = widget.gaji;
    String waktu = widget.waktu;

    GajiBloc detailGajiBloc = GajiBloc();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kNeutral20,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kBlue,
          ),
        ),
        backgroundColor: kWhite,
        title: Text(
          'Detail Gaji',
          style: kPoppinsSemiBold.copyWith(fontSize: 18, color: kBlack),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal! * 3.40,
                      vertical: SizeConfig.blockSizeVertical! * 3.50,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 3.00,
                            vertical: SizeConfig.blockSizeVertical! * 2.50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  //ini nanti pass dari page sebelumnya
                                  'Rp. ${gaji}',
                                  style: kPoppinsSemiBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 6.85,
                                    color: kWhite,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical! * 1,
                                ),
                                Text(
                                  //ini nanti datanya didapat dari page sebelumnya
                                  '$waktu',
                                  style: kPoppinsMedium.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! *
                                              3.50,
                                      color: kNeutral10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 10,
                    color: kNeutral30,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 3.40,
                  vertical: SizeConfig.blockSizeVertical! * 1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // TODO
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kOrange,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal! * 4,
                              vertical: SizeConfig.blockSizeVertical! * 1,
                            ),
                            child: Center(
                              child: Text(
                                'Pemasukan',
                                style: kPoppinsRegular.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                    color: kWhite),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kNeutral30,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal! * 4,
                              vertical: SizeConfig.blockSizeVertical! * 1,
                            ),
                            child: Center(
                              child: Text(
                                'Potongan',
                                style: kPoppinsRegular.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                    color: kNeutral60),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2,
                    ),
                    BlocBuilder<GajiBloc, GajiState>(
                      bloc: detailGajiBloc..add(GetGajiEvent()),
                      builder: (context, state) {
                        if (state is GajiLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: kBlue,
                            ),
                          );
                        } else if (state is GajiLoaded) {
                          var data = state.data;
                          return Column(
                            children: [
                              Column(
                                children: data.map(
                                  (item) {
                                    return Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: kWhite,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  2,
                                              vertical: SizeConfig
                                                      .blockSizeVertical! *
                                                  2,
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/pemasukan.svg'),
                                                SizedBox(
                                                  width: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      2,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Rp. ${item.gaji}',
                                                      style: kPoppinsMedium
                                                          .copyWith(
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            4.00,
                                                      ),
                                                    ),
                                                    Text(
                                                      item.waktu,
                                                      style: kPoppinsRegular
                                                          .copyWith(
                                                        fontSize: SizeConfig
                                                                .blockSizeHorizontal! *
                                                            3.00,
                                                        color: kNeutral70,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: SizeConfig.blockSizeVertical! * 2,
                                        ),
                                      ],
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          );
                        } else if (state is GajiError) {
                          return Center(child: Text(state.errorMsg));
                        } else {
                          return Center(
                            child: Text('Gagal...'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
