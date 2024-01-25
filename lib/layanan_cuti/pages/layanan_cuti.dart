import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/cuti-rekap_model.dart';
import '../models/cuti-daftar_model.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../bloc/layanan_cuti_bloc.dart';
import '../../services/services.dart';

class LayananCutiPage extends StatelessWidget {
  const LayananCutiPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final LayananCutiBloc layananCutiBloc = LayananCutiBloc();
    final double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: kBlue,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: kWhite,
          onPressed: () => Navigator.pop(context),
          // onPressed: () async {
          // final List<CutiTahunan> data = await Services.fetchAPICutiTahunan();
          // final CutiRekap cutiRekap = await Services.fetchAPICutiRekap();
          // print(cutiRekap);
          // },
        ),
        title: Text(
          'Layanan Cuti',
          style: kPoppinsBold.copyWith(
            color: kWhite,
            fontSize: SizeConfig.blockSizeHorizontal! * 4.675,
          ),
        ),
        centerTitle: true,
        backgroundColor: kBlue,
      ),
      body: RefreshIndicator(
        onRefresh: () async => layananCutiBloc.add(GetLayananCutiEvent()),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                child: BlocBuilder<LayananCutiBloc, LayananCutiState>(
                  bloc: layananCutiBloc..add(GetLayananCutiEvent()),
                  builder: (context, state) {
                    if (state is LayananCutiLoading) {
                      return Container(
                        height: SizeConfig.screenHeight,
                        color: const Color((0xFFF6F7F9)),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is LayananCutiLoaded) {
                      final CutiDaftar cutiDaftar = state.cutiDaftar;
                      final CutiRekap cutiRekap = state.cutiRekap;
                      return Container(
                        height: cutiDaftar.data.isNotEmpty
                            ? null
                            : SizeConfig.screenHeight! - appBarHeight,
                        color: const Color((0xFFF6F7F9)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 4.675,
                            vertical: SizeConfig.blockSizeHorizontal! * 7.5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<LayananCutiBloc, LayananCutiState>(
                                bloc: layananCutiBloc,
                                builder: (context, state) {
                                  if (state is LayananCutiLoaded) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        KeteranganCutiWidget(
                                          teks: "Sisa Cuti",
                                          angka: cutiRekap.data.sisaCuti,
                                          warna: kGreen,
                                        ),
                                        KeteranganCutiWidget(
                                          teks: "Cuti Diambil",
                                          angka: cutiRekap.data.cutiDiambil,
                                          warna: kOrange,
                                        ),
                                        KeteranganCutiWidget(
                                          teks: "Total Cuti",
                                          angka: cutiRekap.data.totalCuti,
                                          warna: kBlue,
                                        ),
                                      ],
                                    );
                                  }
                                  return const Text("Gagal Ambil Data");
                                },
                              ),
                              const SizedBox(height: 16),
                              const Divider(),
                              const SizedBox(height: 16),
                              Text(
                                "Layanan Cuti Tahunan",
                                style: kPoppinsMedium.copyWith(
                                  color: kGrey,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Row(
                                children: [
                                  BerjalanSelesai(
                                      kata: "Berjalan",
                                      warnaBg: Color(0XffEE6C4D),
                                      warnaFont: kWhite),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  BerjalanSelesai(
                                      kata: "Selesai",
                                      warnaBg: kLightGrey,
                                      warnaFont: kNeutral60),
                                ],
                              ),
                              BlocBuilder<LayananCutiBloc, LayananCutiState>(
                                bloc: layananCutiBloc,
                                builder: (context, state) {
                                  if (state is LayananCutiLoaded) {
                                    if (cutiDaftar.data.isNotEmpty) {
                                      return Column(
                                        children: cutiDaftar.data
                                            .map((e) => Column(children: [
                                                  const SizedBox(height: 16),
                                                  ItemCutiDaftar(
                                                      nama: e.keterangan,
                                                      tglMulai: e.tanggalMulai,
                                                      tglSelesai:
                                                          e.tanggalSelesai),
                                                ]))
                                            .toList(),
                                      );
                                    } else {
                                      return Center(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 32),
                                            SvgPicture.asset(
                                                'assets/icons/libur-jadwal-perkuliahan.svg'),
                                            const SizedBox(height: 24),
                                            Text(
                                              'Saat ini tidak ada cuti yang diambil',
                                              style: kPoppinsSemiBold.copyWith(
                                                fontSize: 18,
                                                color: kBlack,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              'Anda belum memiliki cuti yang berjalan',
                                              textAlign: TextAlign.center,
                                              style: kNunitoRegular.copyWith(
                                                fontSize: 14,
                                                color: kNeutral90,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  }
                                  return const Text("Gagal Mengambil Data...");
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return const Text("Gagal Mengambil Data...");
                  },
                ),
              ),
            ),
            Positioned(
              bottom: SizeConfig.screenHeight! * .035,
              right: SizeConfig.screenHeight! * .035,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue,
                ),
                onPressed: () {},
                label: const Text(
                  'Tambah',
                  style: TextStyle(color: kWhite),
                ),
                icon: SvgPicture.asset(
                  'assets/icons/edit-2.svg',
                  colorFilter: const ColorFilter.mode(kWhite, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCutiDaftar extends StatelessWidget {
  final String nama;
  final String tglMulai;
  final String tglSelesai;
  const ItemCutiDaftar({
    super.key,
    required this.nama,
    required this.tglMulai,
    required this.tglSelesai,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: kWhite,
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nama,
                  style: kPoppinsMedium,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.drive_file_rename_outline,
                    color: kBlue,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tanggal Cuti",
                  style: kPoppinsMedium.copyWith(
                    color: kGrey,
                  ),
                ),
                Text(
                  "Selesai Cuti",
                  style: kPoppinsMedium.copyWith(
                    color: kGrey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tglMulai,
                  style: kPoppinsMedium.copyWith(
                    color: kBlue,
                  ),
                ),
                Text(
                  tglSelesai,
                  style: kPoppinsMedium.copyWith(
                    color: kBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
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
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(24),
      ),
      child: Container(
        color: kWhite,
        width: SizeConfig.screenWidth! * .275,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              teks,
              style: kPoppinsMedium.copyWith(
                color: kGrey,
              ),
            ),
            Text(
              angka,
              style: kPoppinsBold.copyWith(
                color: warna,
                fontSize: 32,
              ),
            ),
          ],
        ),
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
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: warnaBg,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal! * 3.75,
        vertical: SizeConfig.blockSizeHorizontal! * 1.87,
      ),
      child: Center(
        child: Text(
          kata,
          style: kPoppinsRegular.copyWith(
            color: warnaFont,
            fontSize: SizeConfig.blockSizeHorizontal! * 2.85,
          ),
        ),
      ),
    );
  }
}
