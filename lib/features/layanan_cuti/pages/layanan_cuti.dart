import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants_finals.dart';
import 'sunting_cuti_page.dart';
import 'tambah_cuti_page.dart';
import '../models/cuti-rekap_model.dart';
import '../models/cuti-daftar_model.dart';
import '../../../helper/size_config.dart';
import '../bloc/layanan_cuti_bloc.dart';

class LayananCutiPage extends StatelessWidget {
  const LayananCutiPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final LayananCutiBloc layananCutiBloc = context.read<LayananCutiBloc>();

    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  colorFilter: const ColorFilter.mode(kWhite, BlendMode.srcIn),
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
          onRefresh: () async => layananCutiBloc.add(GetLayananCutiEvent()),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: SizeConfig.screenHeight!,
                  ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(Screen.kSize32),
                    ),
                  ),
                  width: SizeConfig.screenWidth,
                  child: BlocBuilder<LayananCutiBloc, LayananCutiState>(
                    bloc: layananCutiBloc..add(GetLayananCutiEvent()),
                    builder: (context, state) {
                      if (state is LayananCutiLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is LayananCutiLoaded) {
                        final CutiDaftar cutiDaftar = state.cutiDaftar;
                        final CutiRekap cutiRekap = state.cutiRekap;
                        final List<Widget> cardsView = [
                          KeteranganCutiWidget(
                            teks: 'Sisa Cuti',
                            angka: cutiRekap.data.sisaCuti,
                            warna: kGreen,
                          ),
                          KeteranganCutiWidget(
                            teks: 'Cuti Diambil',
                            angka: cutiRekap.data.cutiDiambil,
                            warna: kOrange,
                          ),
                          KeteranganCutiWidget(
                            teks: 'Total Cuti',
                            angka: cutiRekap.data.totalCuti,
                            warna: kBlue,
                          ),
                        ];
                        // cutiDaftar.data.clear();
                        return Container(
                          constraints: BoxConstraints(
                            minHeight: SizeConfig.screenHeight!,
                          ),
                          decoration: const BoxDecoration(
                            color: bgColor,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(32)),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Screen.kSize20,
                            vertical: Screen.kSize32,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: cardsView,
                              ),
                              SizedBox(height: Screen.kSize16),
                              const Divider(),
                              SizedBox(height: Screen.kSize16),
                              Text(
                                'Layanan Cuti Tahunan',
                                style: Styles.kPoppinsMedium.copyWith(
                                  color: kGrey,
                                  fontSize: Screen.kSize16,
                                ),
                              ),
                              SizedBox(height: Screen.kSize16),
                              BlocBuilder<LayananCutiBloc, LayananCutiState>(
                                bloc: layananCutiBloc,
                                builder: (context, state) {
                                  final bool isBerjalan =
                                      (state as LayananCutiLoaded).isBerjalan;
                                  return Row(
                                    children: [
                                      InkWell(
                                        onTap: () => layananCutiBloc
                                            .add(GetLayananCutiEvent()),
                                        child: BerjalanSelesai(
                                            kata: 'Berjalan',
                                            warnaBg: isBerjalan
                                                ? const Color(0XffEE6C4D)
                                                : kLightGrey,
                                            warnaFont: isBerjalan
                                                ? kWhite
                                                : kNeutral90),
                                      ),
                                      SizedBox(width: Screen.kSize16),
                                      InkWell(
                                        onTap: () => layananCutiBloc.add(
                                            GetLayananCutiEvent(
                                                isBerjalan: false)),
                                        child: BerjalanSelesai(
                                            kata: 'Selesai',
                                            warnaBg: isBerjalan
                                                ? kLightGrey
                                                : const Color(0XffEE6C4D),
                                            warnaFont: isBerjalan
                                                ? kNeutral60
                                                : kWhite),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              cutiDaftar.data.isNotEmpty
                                  ? Column(
                                      children: cutiDaftar.data
                                          .map((e) => Column(
                                                children: [
                                                  SizedBox(height: Screen.kSize16),
                                                  ItemCutiDaftar(
                                                    dataCutiDaftar: e,
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    )
                                  : Center(
                                      child: Column(
                                        children: [
                                          SizedBox(height: Screen.kSize32),
                                          SvgPicture.asset(
                                              'assets/icons/libur-jadwal-perkuliahan.svg'),
                                          SizedBox(height: Screen.kSize24),
                                          Text(
                                            'Saat ini tidak ada cuti yang diambil',
                                            style: Styles.kPoppinsSemiBold.copyWith(
                                              fontSize: Screen.kSize18,
                                              color: kBlack,
                                            ),
                                          ),
                                          SizedBox(height: Screen.kSize8),
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
                                    ),
                            ],
                          ),
                        );
                      }
                      return Center(
                        child: ElevatedButton(
                          onPressed: () =>
                              layananCutiBloc.add(GetLayananCutiEvent()),
                          child: const Text('Ulangi'),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: SizeConfig.screenHeight! * .035,
                right: SizeConfig.screenHeight! * .035,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: kBlue),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TambahCutiPage(),
                    ),
                  ),
                  label: const Text(
                    'Tambah',
                    style: TextStyle(color: kWhite),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/edit-2.svg',
                    colorFilter:
                        const ColorFilter.mode(kWhite, BlendMode.srcIn),
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

class ItemCutiDaftar extends StatelessWidget {
  final DataCutiDaftar dataCutiDaftar;
  const ItemCutiDaftar({
    super.key,
    required this.dataCutiDaftar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Screen.kSize12),
        ),
        shadows: boxShadow,
      ),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenWidth! * .25,
      padding: EdgeInsets.all(Screen.kSize12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataCutiDaftar.keterangan,
                style: Styles.kPoppinsMedium,
              ),
              Material(
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SuntingCutiPage(dataCutiDaftar: dataCutiDaftar),
                  )),
                  child: SvgPicture.asset(
                    "assets/icons/edit-2.svg",
                    width: Screen.kSize24,
                  ),
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Cuti',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: Screen.kSize14,
                ),
              ),
              Text(
                'Selesai Cuti',
                style: Styles.kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: Screen.kSize14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataCutiDaftar.tanggalMulai,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: Screen.kSize14,
                ),
              ),
              Text(
                dataCutiDaftar.tanggalSelesai,
                style: Styles.kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: Screen.kSize14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class KeteranganCutiWidget extends StatelessWidget {
  final String teks;
  final String angka;
  final Color warna;
  const KeteranganCutiWidget({
    super.key,
    required this.teks,
    required this.angka,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: kWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Screen.kSize12)),
        shadows: boxShadow,
      ),
      width: SizeConfig.screenWidth! * .275,
      height: Screen.kSize40 * 2 + 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teks,
            style: Styles.kNunitoMedium.copyWith(
              color: kGrey,
              fontSize: Screen.kSize14,
            ),
          ),
          Text(
            angka,
            style: Styles.kPoppinsSemiBold.copyWith(
              color: warna,
              fontSize: Screen.kSize32,
            ),
          ),
        ],
      ),
    );
  }
}

class BerjalanSelesai extends StatelessWidget {
  final String kata;
  final Color warnaBg;
  final Color warnaFont;
  const BerjalanSelesai({
    super.key,
    required this.kata,
    required this.warnaBg,
    required this.warnaFont,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.kSize32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Screen.kSize12),
        color: warnaBg,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Screen.kSize16,
        vertical: Screen.kSize8,
      ),
      child: Center(
        child: Text(
          kata,
          style: Styles.kPoppinsRegular.copyWith(
            color: warnaFont,
            fontSize: Screen.kSize12,
          ),
        ),
      ),
    );
  }
}
