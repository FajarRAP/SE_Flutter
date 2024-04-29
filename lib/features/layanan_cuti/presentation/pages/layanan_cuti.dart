import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konsumsi_api_agenda/core/functions.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/cuti_cubit.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';
import '../widgets/button_berjalan_selesai.dart';
import '../widgets/item_cuti.dart';
import '../widgets/item_rekap_cuti.dart';
import '../widgets/loading_rekap_shimmer.dart';

class LayananCutiPage extends StatelessWidget {
  const LayananCutiPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CutiCubit cutiCubit = context.read<CutiCubit>();
    final TambahSuntingCutiCubit tambahSuntingCutiCubit =
        context.read<TambahSuntingCutiCubit>();

    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kWhite,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              title: Text(
                'Layanan Cuti',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
            )
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            cutiCubit.clickBerjalan();
            cutiCubit.getRekapCuti();
            cutiCubit.getCutis();
          },
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rekap Cuti
                      BlocBuilder<CutiCubit, CutiState>(
                        bloc: cutiCubit..getRekapCuti(),
                        buildWhen: (previous, current) => current is RekapCuti,
                        builder: (context, state) {
                          // Rekap Cuti Loading
                          if (state is RekapCutiLoading) {
                            return const LoadingRekapShimmer();
                          }

                          // Rekap Cuti Loaded
                          if (state is RekapCutiLoaded) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ItemRekapCuti(
                                  teks: 'Sisa Cuti',
                                  angka: state.data.sisaCuti,
                                  warna: kGreen,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ItemRekapCuti(
                                  teks: 'Cuti Diambil',
                                  angka: state.data.cutiDiambil,
                                  warna: kOrange,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ItemRekapCuti(
                                  teks: 'Total Cuti',
                                  angka: state.data.totalCuti,
                                  warna: kBlue,
                                ),
                              ],
                            );
                          }

                          // Default
                          return const LoadingRekapShimmer();
                        },
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),

                      Text(
                        'Layanan Cuti Tahunan',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kGrey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),

                      // Button Berjalan Selesai
                      BlocBuilder<CutiCubit, CutiState>(
                        bloc: cutiCubit,
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cutiCubit.clickBerjalan();
                                      cutiCubit.getCutis();
                                    },
                                    child: ButtonBerjalanSelesai(
                                      kata: 'Berjalan',
                                      isBerjalan: cutiCubit.getIsBerjalan,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cutiCubit.clickSelesai();
                                      cutiCubit.getCutis();
                                    },
                                    child: ButtonBerjalanSelesai(
                                      kata: 'Selesai',
                                      isBerjalan: !cutiCubit.getIsBerjalan,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  ourMonthPicker(context);
                                },
                                child: Text(
                                  'Bulan ${cutiCubit.getTanggal}',
                                  style: Styles.kPoppinsMedium.copyWith(
                                    color: kNeutral80,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      // Daftar Cuti
                      Expanded(
                        child: BlocBuilder<CutiCubit, CutiState>(
                          bloc: cutiCubit..getCutis(),
                          buildWhen: (previous, current) => current is Cuti,
                          builder: (context, state) {
                            // Cuti Loading
                            if (state is CutiLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            // Cuti Loaded
                            if (state is CutiLoaded) {
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return ItemCuti(
                                    dataCutiModel: state.data[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 16,
                                  );
                                },
                                itemCount: state.data.length,
                              );
                            }

                            // Cuti Empty
                            if (state is CutiEmpty) {
                              return Center(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    SvgPicture.asset(
                                      emptyDataSvg,
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      'Saat ini tidak ada cuti yang diambil',
                                      style: Styles.kPoppinsSemiBold.copyWith(
                                        color: kBlack,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Anda belum memiliki cuti yang berjalan',
                                      textAlign: TextAlign.center,
                                      style: Styles.kNunitoRegular.copyWith(
                                        color: kNeutral90,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  cutiCubit.getRekapCuti();
                                  cutiCubit.getCutis();
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

              // Tombol Tambah
              Positioned(
                bottom: 20,
                right: 20,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlue,
                  ),
                  onPressed: () {
                    tambahSuntingCutiCubit.resetDataCuti();
                    Navigator.of(context).pushNamed(layananCutiTambahRoute);
                  },
                  label: const Text(
                    'Tambah',
                    style: TextStyle(
                      color: kWhite,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    penEditSvg,
                    colorFilter: const ColorFilter.mode(
                      kWhite,
                      BlendMode.srcIn,
                    ),
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
