import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/detail_tunjangan_cubit.dart';
import '../widgets/item_detail_tunjangan.dart';

class DetailTunjanganBerasPage extends StatelessWidget {
  const DetailTunjanganBerasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailTunjanganCubit detailTunjanganCubit =
        context.read<DetailTunjanganCubit>();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadiusDirectional.circular(4),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Tunjangan Beras',
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kBlack,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: BlocBuilder<DetailTunjanganCubit, DetailTunjanganState>(
                  bloc: detailTunjanganCubit..getDetailTunjangan(),
                  builder: (context, state) {
                    // Loading
                    if (state is DetailTunjanganLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Loaded
                    if (state is DetailTunjanganLoaded) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // QR Code
                            Container(
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 32,
                              ),
                              child: PrettyQrView.data(
                                data: state.data.qrcode,
                              ),
                            ),

                            Container(
                              color: bgColor,
                              height: 8,
                            ),
                            const SizedBox(
                              height: 32,
                            ),

                            // Berat
                            ItemDetailTunjangan(
                              title: 'Berat',
                              value: state.data.berat,
                            ),

                            const SizedBox(
                              height: 24,
                            ),

                            // Tanggal
                            ItemDetailTunjangan(
                              title: 'Tanggal',
                              value: state.data.tglAmbil,
                            ),

                            const SizedBox(
                              height: 24,
                            ),

                            // Lokasi
                            ItemDetailTunjangan(
                              title: 'Lokasi',
                              value: state.data.lokasiAmbil,
                            )
                          ],
                        ),
                      );
                    }

                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          detailTunjanganCubit.getDetailTunjangan();
                        },
                        child: const Text('Ulangi'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

