import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/detail_gaji_cubit.dart';
import '../widgets/button_detail_gaji.dart';
import '../widgets/item_detail_gaji.dart';

class DetailGajiPage extends StatelessWidget {
  const DetailGajiPage({
    super.key,
  });

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
                  width: 24,
                  height: 24,
                ),
              ),
              shadowColor: const Color(0x25293241).withOpacity(.5),
              title: Text(
                'Detail Gaji',
                style: Styles.kPoppinsMedium.copyWith(
                  fontSize: 18,
                  color: kBlack,
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            // Bagian Atas
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              child: Container(
                width: Screen.width,
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
                      detailGajiCubit.dataGaji!.nominal,
                      style: Styles.kPoppinsSemiBold.copyWith(
                        fontSize: 28,
                        color: kWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      detailGajiCubit.dataGaji!.bulan,
                      style: Styles.kNunitoRegular.copyWith(
                        fontSize: 14,
                        color: kNeutral20,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 8,
              color: const Color(0xFFEEF2F3),
            ),
            const SizedBox(
              height: 24,
            ),

            // Bagian Bawah
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    // Button
                    BlocBuilder<DetailGajiCubit, DetailGajiState>(
                      bloc: detailGajiCubit,
                      builder: (context, state) {
                        return Row(
                          children: [
                            ButtonDetailGaji(
                              kata: 'Pemasukan',
                              warnaBg: detailGajiCubit.isPemasukan
                                  ? bgButton
                                  : kLightGrey,
                              warnaFont: detailGajiCubit.isPemasukan
                                  ? kWhite
                                  : kNeutral60,
                              onTap: () {
                                detailGajiCubit.clickPemasukan();
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            ButtonDetailGaji(
                              kata: 'Pengeluaran',
                              warnaBg: detailGajiCubit.isPemasukan
                                  ? kLightGrey
                                  : bgButton,
                              warnaFont: detailGajiCubit.isPemasukan
                                  ? kNeutral60
                                  : kWhite,
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
                          if (state is DetailGajiLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is DetailGajiLoaded) {
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                return ItemDetailGaji(
                                  gambar: detailGajiCubit.isPemasukan
                                      ? pemasukanSvg
                                      : pengeluaranSvg,
                                  nominal: state.data[index].nominal,
                                  keterangan: state.data[index].keterangan,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 12,
                                );
                              },
                              itemCount: state.data.length,
                            );
                          }

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
    );
  }
}
