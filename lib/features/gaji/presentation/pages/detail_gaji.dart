import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/detail_gaji_cubit.dart';
import '../widgets/button_detail_gaji.dart';
import '../widgets/card_top.dart';
import '../widgets/item_detail_gaji.dart';

class DetailGajiPage extends StatelessWidget {
  const DetailGajiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailGajiCubit detailGajiCubit = context.read<DetailGajiCubit>();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kWhite,
              centerTitle: true,
              elevation: 4,
              forceElevated: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kBlue,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              shadowColor: const Color(0x25293241).withOpacity(.5),
              title: Text(
                'Detail Gaji',
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlack,
                  fontSize: 18,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            detailGajiCubit.getDetailGaji();
          },
          child: Column(
            children: [
              // Bagian Atas
              const CardTop(),

              Container(
                height: 8,
                color: const Color(0xFFEEF2F3),
              ),
              const SizedBox(height: 24),

              // Bagian Bawah
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Button
                      BlocBuilder<DetailGajiCubit, DetailGajiState>(
                        bloc: detailGajiCubit,
                        builder: (context, state) {
                          return Row(
                            children: [
                              // Pemasukan
                              ButtonDetailGaji(
                                kata: 'Pemasukan',
                                isPemasukan: detailGajiCubit.getIsPemasukan,
                                onTap: () {
                                  detailGajiCubit.clickPemasukan();
                                },
                              ),

                              const SizedBox(width: 12),

                              // Pengeluaran
                              ButtonDetailGaji(
                                kata: 'Pengeluaran',
                                isPemasukan: !detailGajiCubit.getIsPemasukan,
                                onTap: () {
                                  detailGajiCubit.clickPotongan();
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      // Item
                      Expanded(
                        child: BlocBuilder<DetailGajiCubit, DetailGajiState>(
                          bloc: detailGajiCubit..getDetailGaji(),
                          builder: (context, state) {
                            // Loading
                            if (state is DetailGajiLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            // Loaded
                            if (state is DetailGajiLoaded) {
                              return ListView.separated(
                                itemBuilder: (context, index) {
                                  return ItemDetailGaji(
                                    isPemasukan: detailGajiCubit.getIsPemasukan,
                                    nominal: state.data[index].nominal,
                                    keterangan: state.data[index].keterangan,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 12);
                                },
                                itemCount: state.data.length,
                              );
                            }

                            // Default
                            return Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  detailGajiCubit.getDetailGaji();
                                },
                                child: const Text('Ulangi'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
