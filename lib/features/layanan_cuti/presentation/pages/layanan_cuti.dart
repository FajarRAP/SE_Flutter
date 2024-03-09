import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/cuti_cubit.dart';
import '../cubit/tambah_sunting_cuti_cubit.dart';
import '../widgets/button_berjalan_selesai.dart';
import '../widgets/item_cuti.dart';
import '../widgets/item_rekap_cuti.dart';

class LayananCutiPage extends StatelessWidget {
  const LayananCutiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CutiCubit cutiCubit = context.read<CutiCubit>();
    final TambahSuntingCutiCubit tambahSuntingCutiCubit = context.read<TambahSuntingCutiCubit>();

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
                  width: Screen.kSize24,
                  height: Screen.kSize24,
                ),
              ),
              title: Text(
                'Layanan Cuti',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: Screen.kSize20,
                ),
              ),
            )
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async {
            cutiCubit.isBerjalan = true;
            cutiCubit.getRekapCuti();
            cutiCubit.getCutis();
          },
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: Screen.height,
                ),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      Screen.kSize32,
                    ),
                  ),
                ),
                width: Screen.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Screen.kSize20,
                    vertical: Screen.kSize32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rekap Cuti
                      BlocBuilder<CutiCubit, CutiState>(
                        bloc: cutiCubit..getRekapCuti(),
                        buildWhen: (previous, current) => current is RekapCuti,
                        builder: (context, state) {
                          if (state is RekapCutiLoading) {
                            return Shimmer.fromColors(
                              baseColor: kWhite,
                              highlightColor: kNeutral40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    Container(
                                      decoration: ShapeDecoration(
                                        color: kWhite,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            Screen.kSize12,
                                          ),
                                        ),
                                        shadows: boxShadow,
                                      ),
                                      width: Screen.width * .275,
                                      height: Screen.kSize40 * 2 + 20,
                                    ),
                                ],
                              ),
                            );
                          }

                          if (state is RekapCutiLoaded) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ItemRekapCuti(
                                  teks: 'Sisa Cuti',
                                  angka:
                                      cutiCubit.rekapCutiModel!.data.sisaCuti,
                                  warna: kGreen,
                                ),
                                ItemRekapCuti(
                                  teks: 'Cuti Diambil',
                                  angka: cutiCubit
                                      .rekapCutiModel!.data.cutiDiambil,
                                  warna: kOrange,
                                ),
                                ItemRekapCuti(
                                  teks: 'Total Cuti',
                                  angka:
                                      cutiCubit.rekapCutiModel!.data.totalCuti,
                                  warna: kBlue,
                                ),
                              ],
                            );
                          }

                          return Shimmer.fromColors(
                            baseColor: kWhite,
                            highlightColor: kNeutral40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Container(
                                    decoration: ShapeDecoration(
                                      color: kWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          Screen.kSize12,
                                        ),
                                      ),
                                      shadows: boxShadow,
                                    ),
                                    width: Screen.width * .275,
                                    height: Screen.kSize40 * 2 + 20,
                                  ),
                              ],
                            ),
                          );
                        },
                      ),

                      SizedBox(
                        height: Screen.kSize16,
                      ),
                      const Divider(),
                      SizedBox(
                        height: Screen.kSize16,
                      ),
                      Text(
                        'Layanan Cuti Tahunan',
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kGrey,
                          fontSize: Screen.kSize16,
                        ),
                      ),
                      SizedBox(
                        height: Screen.kSize16,
                      ),

                      // Button Berjalan Selesai
                      BlocBuilder<CutiCubit, CutiState>(
                        bloc: cutiCubit,
                        builder: (context, state) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cutiCubit.isBerjalan = true;
                                  cutiCubit.getCutis();
                                },
                                child: ButtonBerjalanSelesai(
                                  kata: 'Berjalan',
                                  warnaBg: cutiCubit.isBerjalan
                                      ? const Color(0XffEE6C4D)
                                      : kLightGrey,
                                  warnaFont: cutiCubit.isBerjalan
                                      ? kWhite
                                      : kNeutral60,
                                ),
                              ),
                              SizedBox(
                                width: Screen.kSize16,
                              ),
                              InkWell(
                                onTap: () {
                                  cutiCubit.isBerjalan = false;
                                  cutiCubit.getCutis();
                                },
                                child: ButtonBerjalanSelesai(
                                  kata: 'Selesai',
                                  warnaBg: cutiCubit.isBerjalan
                                      ? kLightGrey
                                      : const Color(0XffEE6C4D),
                                  warnaFont: cutiCubit.isBerjalan
                                      ? kNeutral60
                                      : kWhite,
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      SizedBox(
                        height: Screen.kSize16,
                      ),

                      // Daftar Cuti
                      Expanded(
                        child: BlocBuilder<CutiCubit, CutiState>(
                          bloc: cutiCubit..getCutis(),
                          buildWhen: (previous, current) => current is Cuti,
                          builder: (context, state) {
                            if (state is CutiLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is CutiLoaded) {
                              return ListView.separated(
                                itemBuilder: (context, index) {
                                  return ItemCuti(
                                    dataCutiModel:
                                        cutiCubit.cutiModel!.data[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: Screen.kSize16,
                                  );
                                },
                                itemCount: cutiCubit.cutiModel!.data.length,
                              );
                            }

                            if (state is CutiEmpty) {
                              return Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: Screen.kSize32,
                                    ),
                                    SvgPicture.asset(
                                        'assets/icons/libur-jadwal-perkuliahan.svg'),
                                    SizedBox(
                                      height: Screen.kSize24,
                                    ),
                                    Text(
                                      'Saat ini tidak ada cuti yang diambil',
                                      style: Styles.kPoppinsSemiBold.copyWith(
                                        fontSize: Screen.kSize18,
                                        color: kBlack,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Screen.kSize8,
                                    ),
                                    Text(
                                      'Anda belum memiliki cuti yang berjalan',
                                      textAlign: TextAlign.center,
                                      style: Styles.kNunitoRegular.copyWith(
                                        fontSize: Screen.kSize14,
                                        color: kNeutral90,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Center(
                              child: ElevatedButton(
                                onPressed: () {},
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
              Positioned(
                bottom: Screen.height * .035,
                right: Screen.height * .035,
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
                    style: TextStyle(color: kWhite),
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
