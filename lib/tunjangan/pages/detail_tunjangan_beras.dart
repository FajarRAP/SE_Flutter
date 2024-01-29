import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../helper/app_styles.dart';
import '../../../helper/size_config.dart';
import '../bloc/tunjangan_bloc.dart';

class DetailTunjanganBeras extends StatelessWidget {
  const DetailTunjanganBeras({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final databloc = TunjanganBloc();
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/arrow-left.svg')
                    ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeHorizontal! * 5.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: SizeConfig.blockSizeHorizontal! * 1.87),
                      width: SizeConfig.blockSizeHorizontal! * 4.25,
                      height: SizeConfig.blockSizeHorizontal! * 4.25,
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadiusDirectional.circular(
                              SizeConfig.blockSizeHorizontal! * 1)),
                    ),
                    SizedBox(
                      width: SizeConfig.blockSizeHorizontal! * 3.75,
                    ),
                    Text(
                      'Tunjangan Beras',
                      style: kPoppinsMedium.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
                          color: kBlack),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 1,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 4.675),
                child: BlocBuilder<TunjanganBloc, TunjanganState>(
                  bloc: databloc..add(GetDetailTunjanganEvent()),
                  builder: (context, state) {
                    if (state is TunjanganDetailLoading) {
                      return const Center();
                    } else if (state is TunjanganDetailLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(16)),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    SizeConfig.blockSizeHorizontal! * 4.675,
                                vertical:
                                    SizeConfig.blockSizeHorizontal! * 7.5),
                            child: PrettyQrView.data(
                              data: state.data.data.qrcode,
                            ),
                          ),
                          Container(
                            height: 8,
                            color: Color(0xFFF6F7F9),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal! * 7.5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/tunjangan-beras-berat.svg',
                                width: SizeConfig.blockSizeHorizontal! * 9.35,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 3.75,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Berat',
                                    style: kPoppinsRegular.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.25,
                                        color: kNeutral80),
                                  ),
                                  Text(
                                    state.data.data.berat,
                                    style: kNunitoSemiBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.75,
                                        color: kBlack),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal! * 5.5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/tunjangan-beras-tanggal.svg',
                                width: SizeConfig.blockSizeHorizontal! * 9.35,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 3.75,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pukul',
                                    style: kPoppinsRegular.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.25,
                                        color: kNeutral80),
                                  ),
                                  Text(
                                    state.data.data.tglAmbil,
                                    style: kNunitoSemiBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.75,
                                        color: kBlack),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal! * 5.5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/tunjangan-beras-lokasi.svg',
                                width: SizeConfig.blockSizeHorizontal! * 9.35,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 3.75,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lokasi',
                                      style: kPoppinsRegular.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3.25,
                                          color: kNeutral80),
                                    ),
                                    Text(
                                      state.data.data.lokasiAmbil,
                                      style: kNunitoSemiBold.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3.75,
                                          color: kBlack),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                      
                    } else if (state is TunjanganDetailError) {
                      return const Center();
                    } else {
                      return const Center();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
