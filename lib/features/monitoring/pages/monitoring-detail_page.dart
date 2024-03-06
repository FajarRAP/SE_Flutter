import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

import '../../../core/constants_finals.dart';
import '../../../helper/size_config.dart';
import '../bloc/detail_monitoring_bloc.dart';
import '../models/monitoring-detail_model.dart';
import '../models/monitoring-rekap_model.dart';

class DetailMonitoringPage extends StatelessWidget {
  final String nama;
  const DetailMonitoringPage({
    super.key,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final DetailMonitoringBloc detailMonitoringBloc =
        context.read<DetailMonitoringBloc>();
    String date = DateFormat('M, y').format(DateTime.now());

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
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  colorFilter: const ColorFilter.mode(kWhite, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                  width: Screen.kSize24,
                  height: Screen.kSize24,
                ),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async =>
              detailMonitoringBloc.add(GetDetailMonitoringEvent()),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: SizeConfig.screenHeight!,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(Screen.kSize32)),
              ),
              padding: EdgeInsets.symmetric(
                vertical: Screen.kSize32,
                horizontal: Screen.kSize20,
              ),
              width: SizeConfig.screenWidth,
              child: BlocBuilder<DetailMonitoringBloc, DetailMonitoringState>(
                bloc: detailMonitoringBloc..add(GetDetailMonitoringEvent()),
                builder: (context, state) {
                  if (state is DetailMonitoringLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DetailMonitoringLoadedState) {
                    final MonitoringRekap monitoringRekap = state.rekap;
                    final MonitoringDetail monitoringDetail = state.detail;
                    final int totalPresensi = monitoringRekap.data.onTime +
                        monitoringRekap.data.absen +
                        monitoringRekap.data.telat;
                    return Column(
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            color: kWhite,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Screen.kSize20)),
                            shadows: boxShadow,
                          ),
                          padding: EdgeInsets.all(Screen.kSize20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nama,
                                style: Styles.kPoppinsMedium.copyWith(
                                  color: kBlue,
                                  fontSize: Screen.kSize16,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final DateTime? value =
                                          await selectDate(context);
                                      if (value != null) {
                                        date = DateFormat('M, y').format(value);
                                        detailMonitoringBloc
                                            .add(GetDetailMonitoringEvent());
                                      }
                                    },
                                    child: Text(
                                      'Bulan $date',
                                      style: Styles.kPoppinsSemiBold.copyWith(
                                        color: kNeutral90,
                                        fontSize: Screen.kSize24,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () => detailMonitoringBloc
                                        .add(ClickChangeChartEvent()),
                                    child: Text(
                                      'Ubah Chart',
                                      style: Styles.kPoppinsMedium.copyWith(
                                        color: kBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              BlocBuilder<DetailMonitoringBloc,
                                  DetailMonitoringState>(
                                bloc: detailMonitoringBloc,
                                builder: (context, state) {
                                  final currentState =
                                      state as DetailMonitoringLoadedState;
                                  final List<PieChartSectionData> piecesPie = [
                                    piecePie(
                                        'Tepat',
                                        monitoringRekap.data.onTime.toDouble(),
                                        kGreen),
                                    piecePie(
                                        'Telat',
                                        monitoringRekap.data.telat.toDouble(),
                                        kYellow),
                                    piecePie(
                                        'Absen',
                                        monitoringRekap.data.absen.toDouble(),
                                        kRed),
                                  ];
                                  final List<Widget> cardsView = [
                                    CardView(
                                      kata: 'On Time',
                                      value: monitoringRekap.data.onTime,
                                      warna: kGreen,
                                    ),
                                    SizedBox(width: Screen.kSize16),
                                    CardView(
                                      kata: 'Telat',
                                      value: monitoringRekap.data.telat,
                                      warna: kYellow,
                                    ),
                                    SizedBox(width: Screen.kSize16),
                                    CardView(
                                      kata: 'Absen',
                                      value: monitoringRekap.data.absen,
                                      warna: kRed,
                                    ),
                                  ];
                                  return SizedBox(
                                    width: SizeConfig.screenWidth,
                                    height: currentState.isPie
                                        ? SizeConfig.screenWidth! * .25 * 2
                                        : SizeConfig.screenWidth! * .25,
                                    child: currentState.isPie
                                        ? Stack(
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
                                                      style: Styles
                                                          .kNunitoRegular
                                                          .copyWith(
                                                        fontSize:
                                                            Screen.kSize14,
                                                        color: kNeutral70,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: Screen.kSize4),
                                                    Text(
                                                      '$totalPresensi',
                                                      style: Styles
                                                          .kPoppinsSemiBold
                                                          .copyWith(
                                                        fontSize:
                                                            Screen.kSize40,
                                                        color: kBlack,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(children: cardsView),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Screen.kSize24),
                        Container(
                          height: Screen.kSize8,
                          color: const Color(0xFFEEF2F3),
                        ),
                        SizedBox(height: Screen.kSize12),
                        Column(
                          children: monitoringDetail.data
                              .map((e) => Column(
                                    children: [
                                      SizedBox(height: Screen.kSize12),
                                      ItemDetailMonitoring(
                                        dataMonitoringDetail: e,
                                      ),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ],
                    );
                  } else if (state is DetailMonitoringErrorState) {
                    return Text(state.pesan);
                  }
                  return Center(
                    child: ElevatedButton(
                      onPressed: () =>
                          detailMonitoringBloc.add(GetDetailMonitoringEvent()),
                      child: const Text('Ulangi'),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> selectDate(BuildContext context) {
    return showMonthPicker(
      context: context,
      backgroundColor: Colors.white,
      selectedMonthTextColor: kWhite,
      headerColor: kBlue,
      unselectedMonthTextColor: kBlue,
      selectedMonthBackgroundColor: kBlue,
      cancelWidget: const Text(
        'Batal',
        style: TextStyle(
          color: kGrey,
        ),
      ),
      confirmWidget: const Text(
        'Konfirmasi',
        style: TextStyle(
          color: kGrey,
        ),
      ),
    ).then((value) {
      if (value != null) {
        return value;
      }
      return null;
    });
  }

  PieChartSectionData piecePie(String kata, double value, Color warna) {
    return PieChartSectionData(
      color: warna,
      showTitle: false,
      radius: Screen.kSize32,
      value: value,
      badgeWidget: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kBlack),
          borderRadius: BorderRadius.circular(Screen.kSize4),
          color: warna,
        ),
        padding: EdgeInsets.all(Screen.kSize4),
        child: Text(
          '$kata: ${value.toInt()}',
          style: Styles.kNunitoRegular.copyWith(
            color: kWhite,
            fontSize: Screen.kSize14,
          ),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final String kata;
  final int value;
  final Color warna;
  const CardView({
    super.key,
    required this.kata,
    required this.value,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Screen.kSize16, vertical: Screen.kSize14),
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Screen.kSize12),
          ),
          shadows: boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kata,
              style: Styles.kNunitoMedium.copyWith(
                fontSize: Screen.kSize14,
                color: kNeutral90,
              ),
            ),
            SizedBox(height: Screen.kSize4),
            Text(
              value.toString(),
              style: Styles.kPoppinsSemiBold.copyWith(
                fontSize: Screen.kSize28,
                color: warna,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemDetailMonitoring extends StatelessWidget {
  final DataMonitoringDetail dataMonitoringDetail;
  const ItemDetailMonitoring({
    super.key,
    required this.dataMonitoringDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenWidth! * .18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Screen.kSize12),
        color: kWhite,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Screen.kSize14),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      dataMonitoringDetail.hari,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.kPoppinsMedium.copyWith(
                        fontSize: Screen.kSize14,
                        color: kBlack,
                      ),
                    ),
                  ),
                  SizedBox(height: Screen.kSize4),
                  Flexible(
                    child: Text(
                      dataMonitoringDetail.tanggal,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.kNunitoRegular.copyWith(
                        color: kNeutral80,
                        fontSize: Screen.kSize14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Masuk',
                    style: Styles.kPoppinsRegular.copyWith(
                      color: kNeutral80,
                      fontSize: Screen.kSize12,
                    ),
                  ),
                  SizedBox(height: Screen.kSize4),
                  Text(
                    dataMonitoringDetail.masuk,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kGreen,
                      fontSize: Screen.kSize16,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pulang',
                    style: Styles.kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: Screen.kSize12,
                    ),
                  ),
                  SizedBox(height: Screen.kSize4),
                  Text(
                    dataMonitoringDetail.pulang,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kOrange,
                      fontSize: Screen.kSize16,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Status',
                    style: Styles.kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: Screen.kSize12,
                    ),
                  ),
                  SizedBox(height: Screen.kSize4),
                  Text(
                    dataMonitoringDetail.status,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: dataMonitoringDetail.status.toLowerCase() ==
                              "on time"
                          ? kGreen
                          : dataMonitoringDetail.status.toLowerCase() == "telat"
                              ? kYellow
                              : kRed,
                      fontSize: Screen.kSize14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
