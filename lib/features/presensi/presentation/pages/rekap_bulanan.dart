import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';



import '../../../monitoring/presentation/cubit/detail_monitoring_cubit.dart';
import '../../const_final_presensi.dart';
import '../../presensi_function.dart';
import '../cubit/presensi_cubit.dart';
import '../widgets/card_below_chart.dart';
import '../widgets/item_chart_pie.dart';
import '../widgets/item_rekap_bulanan.dart';

class RekapBulananPage extends StatelessWidget {
  const RekapBulananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailMonitoringCubit detailMonitoringCubit =
        context.read<DetailMonitoringCubit>();
    final presensiCubit = context.read<PresensiCubit>();
    final List<PieChartSectionData> piecesPie = [
      itemChartPie(
        'Tepat',
        presensiCubit.getTepat,
        kGreen,
      ),
      itemChartPie(
        'Telat',
        presensiCubit.getTelat,
        kYellow,
      ),
      itemChartPie(
        'Absen',
        presensiCubit.getAbsen,
        kRed,
      ),
    ];
    return Scaffold(
      backgroundColor: bgColor,
      body: RefreshIndicator(
        displacement: 10,
        onRefresh: () async {
          presensiCubit.getDaftarPresensi();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              title: Text(
                'Rekap Bulanan',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  arrowBackSvg,
                  colorFilter: const ColorFilter.mode(
                    kWhite,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: kBlue,
              leading: const SizedBox(),
              expandedHeight: 550,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      // Rekap Monitoring
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: boxShadow,
                          color: kWhite,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        padding: const EdgeInsets.all(20),
                        height: 320,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Statistik Tendik',
                              style: Styles.kNunitoRegular.copyWith(
                                color: kNeutral90,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final DateTime? date =
                                        await ourMonthPicker(context);
                                    if (date != null) {
                                      detailMonitoringCubit.setTanggal = date;
                                    }
                                  },
                                  child: BlocBuilder<DetailMonitoringCubit,
                                      DetailMonitoringState>(
                                    bloc: detailMonitoringCubit,
                                    builder: (context, state) {
                                      return Text(
                                        'Bulan ${detailMonitoringCubit.getTanggal}',
                                        style: Styles.kPoppinsSemiBold.copyWith(
                                          color: kNeutral90,
                                          fontSize: 24,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            // Pie Chart
                            Expanded(
                              child: Stack(
                                children: [
                                  PieChart(
                                    PieChartData(
                                      centerSpaceRadius: 75,
                                      sections: piecesPie,
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Presensi',
                                          style: Styles.kNunitoRegular.copyWith(
                                            fontSize: 14,
                                            color: kNeutral70,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          presensiCubit.getDataRekap.jumlahHari,
                                          style:
                                              Styles.kPoppinsSemiBold.copyWith(
                                            fontSize: 40,
                                            color: kBlack,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Transport dan Total Hari
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CardBelowChart(
                              path: 'rekap-gaji.svg',
                              jenis: 'Transport',
                              data: presensiCubit.getDataRekap.nominalInsentif,
                              keterangan: 'Rupiah',
                            ),
                            const SizedBox(width: 16),
                            CardBelowChart(
                              jenis: 'Total Hari',
                              path: 'rekap-total-hari.svg',
                              data: presensiCubit.getDataRekap.jumlahHari,
                              keterangan: 'Hari kerja',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 8,
                        color: const Color(0xFFEEF2F3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            BlocBuilder<PresensiCubit, PresensiState>(
              bloc: presensiCubit..getDaftarPresensi(),
              buildWhen: (previous, current) => current is DaftarPresensi,
              builder: (context, state) {
                if (state is DaftarPresensiLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (state is DaftarPresensiLoaded) {
                  return SliverList.separated(
                    itemBuilder: (context, index) => ItemRekapBulanan(
                      dataPresensi: state.data[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: state.data.length,
                  );
                }
                return const SliverToBoxAdapter(
                  child: Expanded(
                      child: Center(child: CircularProgressIndicator())),
                );
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
