import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sunting_cuti_page.dart';
import 'tambah_cuti_page.dart';
import '../models/cuti-rekap_model.dart';
import '../models/cuti-daftar_model.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
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
                  width: kSize24,
                  height: kSize24,
                ),
              ),
              title: Text(
                'Layanan Cuti',
                style: kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: kSize20,
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
                      top: Radius.circular(kSize32),
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
                            horizontal: kSize20,
                            vertical: kSize32,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: cardsView,
                              ),
                              SizedBox(height: kSize16),
                              const Divider(),
                              SizedBox(height: kSize16),
                              Text(
                                'Layanan Cuti Tahunan',
                                style: kPoppinsMedium.copyWith(
                                  color: kGrey,
                                  fontSize: kSize16,
                                ),
                              ),
                              SizedBox(height: kSize16),
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
                                      SizedBox(width: kSize16),
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
                                                  SizedBox(height: kSize16),
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
                                          SizedBox(height: kSize32),
                                          SvgPicture.asset(
                                              'assets/icons/libur-jadwal-perkuliahan.svg'),
                                          SizedBox(height: kSize24),
                                          Text(
                                            'Saat ini tidak ada cuti yang diambil',
                                            style: kPoppinsSemiBold.copyWith(
                                              fontSize: kSize18,
                                              color: kBlack,
                                            ),
                                          ),
                                          SizedBox(height: kSize8),
                                          Text(
                                            'Anda belum memiliki cuti yang berjalan',
                                            textAlign: TextAlign.center,
                                            style: kNunitoRegular.copyWith(
                                              fontSize: kSize14,
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
          borderRadius: BorderRadius.circular(kSize12),
        ),
        shadows: boxShadow,
      ),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenWidth! * .25,
      padding: EdgeInsets.all(kSize12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataCutiDaftar.keterangan,
                style: kPoppinsMedium,
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
                    width: kSize24,
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
                style: kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: kSize14,
                ),
              ),
              Text(
                'Selesai Cuti',
                style: kNunitoRegular.copyWith(
                  color: kNeutral90,
                  fontSize: kSize14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dataCutiDaftar.tanggalMulai,
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: kSize14,
                ),
              ),
              Text(
                dataCutiDaftar.tanggalSelesai,
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: kSize14,
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
            borderRadius: BorderRadius.circular(kSize12)),
        shadows: boxShadow,
      ),
      width: SizeConfig.screenWidth! * .275,
      height: kSize40 * 2 + 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teks,
            style: kNunitoMedium.copyWith(
              color: kGrey,
              fontSize: kSize14,
            ),
          ),
          Text(
            angka,
            style: kPoppinsSemiBold.copyWith(
              color: warna,
              fontSize: kSize32,
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
      height: kSize32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSize12),
        color: warnaBg,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSize16,
        vertical: kSize8,
      ),
      child: Center(
        child: Text(
          kata,
          style: kPoppinsRegular.copyWith(
            color: warnaFont,
            fontSize: kSize12,
          ),
        ),
      ),
    );
  }
}
