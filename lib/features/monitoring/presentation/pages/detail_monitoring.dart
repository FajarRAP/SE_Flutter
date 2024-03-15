import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../../../core/functions.dart';
import '../cubit/detail_monitoring_cubit.dart';
import '../widgets/item_chart_card.dart';
import '../widgets/item_chart_pie.dart';
import '../widgets/item_detail_monitoring.dart';

class DetailMonitoringPage extends StatelessWidget {
  const DetailMonitoringPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DetailMonitoringCubit detailMonitoringCubit =
        context.read<DetailMonitoringCubit>();

    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: kBlue,
              centerTitle: true,
              title: Text(
                'Detail Monitoring',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: 20,
                ),
              ),
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
            ),
          ];
        },
        body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            detailMonitoringCubit.getRekapMonitoring();
            detailMonitoringCubit.getDetailMonitoring();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
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
                  padding: const EdgeInsets.all(20),
                  height: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailMonitoringCubit.getNama,
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kBlue,
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
                          TextButton(
                            onPressed: () {
                              detailMonitoringCubit.changeChart();
                            },
                            child: Text(
                              'Ubah Chart',
                              style: Styles.kPoppinsMedium.copyWith(
                                color: kBlue,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Pie Chart dan Card
                      Expanded(
                        child: BlocBuilder<DetailMonitoringCubit,
                            DetailMonitoringState>(
                          bloc: detailMonitoringCubit..getRekapMonitoring(),
                          buildWhen: (previous, current) =>
                              current is RekapMonitoring,
                          builder: (context, state) {
                            // Rekap Loading
                            if (state is RekapMonitoringLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            // Rekap Loaded
                            if (state is RekapMonitoringLoaded &&
                                detailMonitoringCubit.isPie) {
                              final List<PieChartSectionData> piecesPie = [
                                itemChartPie(
                                  'Tepat',
                                  detailMonitoringCubit.getOnTime.toDouble(),
                                  kGreen,
                                ),
                                itemChartPie(
                                  'Telat',
                                  detailMonitoringCubit.getTelat.toDouble(),
                                  kYellow,
                                ),
                                itemChartPie(
                                  'Absen',
                                  detailMonitoringCubit.getAbsen.toDouble(),
                                  kRed,
                                ),
                              ];
                              final int totalPresensi =
                                  detailMonitoringCubit.getTotalPresensi;

                              return Stack(
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
                                          '$totalPresensi',
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
                              );
                            }

                            if (state is RekapMonitoringLoaded &&
                                !detailMonitoringCubit.isPie) {
                              final List<Widget> cardsView = [
                                ItemChartCard(
                                  kata: 'Tepat',
                                  value: detailMonitoringCubit.getOnTime,
                                  warna: kGreen,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ItemChartCard(
                                  kata: 'Telat',
                                  value: detailMonitoringCubit.getTelat,
                                  warna: kYellow,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ItemChartCard(
                                  kata: 'Absen',
                                  value: detailMonitoringCubit.getAbsen,
                                  warna: kRed,
                                ),
                              ];
                              return Row(
                                children: cardsView,
                              );
                            }

                            return const SizedBox();
                          },
                        ),
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
                const SizedBox(
                  height: 12,
                ),

                // Detail Monitoring
                Expanded(
                  child:
                      BlocBuilder<DetailMonitoringCubit, DetailMonitoringState>(
                    bloc: detailMonitoringCubit..getDetailMonitoring(),
                    buildWhen: (previous, current) =>
                        current is DetailMonitoring,
                    builder: (context, state) {
                      // Item Loading
                      if (state is DetailMonitoringLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Item Loaded
                      if (state is DetailMonitoringLoaded) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return ItemDetailMonitoring(
                              dataDetailMonitoring: state.data[index],
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

                      // Default
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            detailMonitoringCubit.getDetailMonitoring();
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
      ),
    );
  }
}
