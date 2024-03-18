
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/detail_tunjangan_cubit.dart';
import '../widgets/tunjangan_kosong.dart';

class DetailTunjangan extends StatelessWidget {
  const DetailTunjangan({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailTunjanganCubit detailTunjangan =
        context.read<DetailTunjanganCubit>();
    return Scaffold(
      backgroundColor: kWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Screen.kSize24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Screen.kSize20,
            ),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/icons/arrow-left.svg')),
          ),
          SizedBox(
            height: Screen.kSize24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: Screen.kSize8),
                  width: Screen.kSize18,
                  height: Screen.kSize18,
                  decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadiusDirectional.circular(
                      Screen.kSize4,
                    ),
                  ),
                ),
                SizedBox(
                  width: Screen.kSize16,
                ),
                Text(
                  'Tunjangan Beras',
                  style: Styles.kPoppinsMedium
                      .copyWith(fontSize: Screen.kSize24, color: kBlack),
                ),
                SizedBox(
                  height: Screen.kSize4,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.kSize20),
            child: BlocBuilder<DetailTunjanganCubit, DetailTunjanganState>(
              bloc: detailTunjangan..getDetailTunjangan(),
              builder: (context, state) {
                if (state is DetailTunjanganLoading) {
                  return const Center();
                } else if (state is DetailTunjanganLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(16)),
                        padding: EdgeInsets.symmetric(
                          horizontal: Screen.kSize20,
                          vertical: Screen.kSize32,
                        ),
                        child: PrettyQrView.data(
                          data: detailTunjangan.detailTunjangan!.data.qrcode,
                        ),
                      ),
                      Container(
                        height: 8,
                        color: Color(0xFFF6F7F9),
                      ),
                      SizedBox(
                        height: Screen.kSize32,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/tunjangan-beras-berat.svg',
                            width: Screen.kSize40,
                          ),
                          SizedBox(
                            width: Screen.kSize16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Berat',
                                style: Styles.kPoppinsRegular.copyWith(
                                    fontSize: Screen.kSize14,
                                    color: kNeutral80),
                              ),
                              Text(
                                detailTunjangan.detailTunjangan!.data.berat,
                                style: Styles.kNunitoSemiBold.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Screen.kSize24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/tunjangan-beras-tanggal.svg',
                            width: Screen.kSize40,
                          ),
                          SizedBox(
                            width: Screen.kSize16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pukul',
                                style: Styles.kPoppinsRegular.copyWith(
                                    fontSize: Screen.kSize14,
                                    color: kNeutral80),
                              ),
                              Text(
                                detailTunjangan.detailTunjangan!.data.tglAmbil,
                                style: Styles.kNunitoSemiBold.copyWith(
                                    fontSize: Screen.kSize16, color: kBlack),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: Screen.kSize24,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/tunjangan-beras-lokasi.svg',
                            width: Screen.kSize40,
                          ),
                          SizedBox(
                            width: Screen.kSize16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lokasi',
                                  style: Styles.kPoppinsRegular.copyWith(
                                      fontSize: Screen.kSize14,
                                      color: kNeutral80),
                                ),
                                Text(
                                  detailTunjangan
                                      .detailTunjangan!.data.lokasiAmbil,
                                  style: Styles.kNunitoSemiBold.copyWith(
                                      fontSize: Screen.kSize16, color: kBlack),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else if (state is DetailTunjanganEmpty) {
                  return const TunjanganKosong();
                } else if (state is DetailTunjanganError) {
                  return const Center();
                } else {
                  return const Center();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
