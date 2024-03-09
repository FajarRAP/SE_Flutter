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
              title: Text(
                'Detail Monitoring',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: Screen.kSize20,
                ),
              ),
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
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  Screen.kSize32,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Screen.kSize20,
              vertical: Screen.kSize32,
            ),
            width: Screen.width,
            child: Column(
              children: [
                // Rekap Monitoring
                Container(
                  decoration: ShapeDecoration(
                    color: kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Screen.kSize20,
                      ),
                    ),
                    shadows: boxShadow,
                  ),
                  padding: EdgeInsets.all(
                    Screen.kSize20,
                  ),
                  height: Screen.width * .75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailMonitoringCubit.getNama,
                        style: Styles.kPoppinsMedium.copyWith(
                          color: kBlue,
                          fontSize: Screen.kSize16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              final DateTime? value =
                                  await ourMonthPicker(context);
                              if (value != null) {
                                detailMonitoringCubit.setTanggal = value;
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
                                    fontSize: Screen.kSize24,
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
                            if (state is RekapMonitoringLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (state is RekapMonitoringLoaded &&
                                detailMonitoringCubit.isPie) {
                              final List<PieChartSectionData> piecesPie = [
                                itemChartPie(
                                  'Tepat',
                                  detailMonitoringCubit
                                      .dataRekapMonitoring.onTime
                                      .toDouble(),
                                  kGreen,
                                ),
                                itemChartPie(
                                  'Telat',
                                  detailMonitoringCubit
                                      .dataRekapMonitoring.telat
                                      .toDouble(),
                                  kYellow,
                                ),
                                itemChartPie(
                                  'Absen',
                                  detailMonitoringCubit
                                      .dataRekapMonitoring.absen
                                      .toDouble(),
                                  kRed,
                                ),
                              ];
                              final int totalPresensi = detailMonitoringCubit
                                      .dataRekapMonitoring.onTime +
                                  detailMonitoringCubit
                                      .dataRekapMonitoring.absen +
                                  detailMonitoringCubit
                                      .dataRekapMonitoring.telat;
                              return Stack(
                                children: [
                                  PieChart(
                                    PieChartData(
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
                                            fontSize: Screen.kSize14,
                                            color: kNeutral70,
                                          ),
                                        ),
                                        SizedBox(
                                          height: Screen.kSize4,
                                        ),
                                        Text(
                                          '$totalPresensi',
                                          style:
                                              Styles.kPoppinsSemiBold.copyWith(
                                            fontSize: Screen.kSize40,
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
                                  kata: 'On Time',
                                  value: detailMonitoringCubit
                                      .dataRekapMonitoring.onTime,
                                  warna: kGreen,
                                ),
                                SizedBox(width: Screen.kSize16),
                                ItemChartCard(
                                  kata: 'Telat',
                                  value: detailMonitoringCubit
                                      .dataRekapMonitoring.telat,
                                  warna: kYellow,
                                ),
                                SizedBox(width: Screen.kSize16),
                                ItemChartCard(
                                  kata: 'Absen',
                                  value: detailMonitoringCubit
                                      .dataRekapMonitoring.absen,
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

                SizedBox(
                  height: Screen.kSize24,
                ),
                Container(
                  height: Screen.kSize8,
                  color: const Color(0xFFEEF2F3),
                ),
                SizedBox(
                  height: Screen.kSize12,
                ),

                // Detail Monitoring
                Expanded(
                  child:
                      BlocBuilder<DetailMonitoringCubit, DetailMonitoringState>(
                    bloc: detailMonitoringCubit..getDetailMonitoring(),
                    buildWhen: (previous, current) =>
                        current is DetailMonitoring,
                    builder: (context, state) {
                      if (state is DetailMonitoringLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is DetailMonitoringLoaded) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return ItemDetailMonitoring(
                              dataDetailMonitoringModel: detailMonitoringCubit
                                  .dataDetailMonitoring[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: Screen.kSize12,
                            );
                          },
                          itemCount:
                              detailMonitoringCubit.dataDetailMonitoring.length,
                        );
                      }

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
