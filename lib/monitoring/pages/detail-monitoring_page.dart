import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:d_chart/d_chart.dart';

import '../bloc/monitoring_bloc.dart';
import '../models/monitoring-detail_model.dart';
import '../models/monitoring-rekap_model.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../../services/services.dart';

class DetailMonitoringPage extends StatelessWidget {
  final String nama;
  const DetailMonitoringPage({
    super.key,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final MonitoringBloc monitoringBloc = MonitoringBloc();
    return Scaffold(
      backgroundColor: kBlue,
      appBar: AppBar(
        backgroundColor: kBlue,
        title: Text(
          "Detail Monitoring",
          style: kPoppinsSemiBold.copyWith(
            color: kWhite,
            fontSize: kSize20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kWhite,
          ),
        ),
      ),
      body: BlocBuilder<MonitoringBloc, MonitoringState>(
        bloc: monitoringBloc..add(GetDetailMonitoringEvent()),
        builder: (context, state) {
          if (state is DetailMonitoringLoadingState) {
            return Container(
              decoration: const BoxDecoration(
                color: Color((0xFFF6F7F9)),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is DetailMonitoringLoadedState) {
            final MonitoringRekap monitoringRekap = state.rekap;
            final MonitoringDetail monitoringDetail = state.detail;
            final int totalPresensi = monitoringRekap.data.onTime +
                monitoringRekap.data.absen +
                monitoringRekap.data.telat;
            return RefreshIndicator(
              onRefresh: () async =>
                  monitoringBloc.add(GetDetailMonitoringEvent()),
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color((0xFFF6F7F9)),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: kSize32, horizontal: kSize20),
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color: kWhite,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x087281DF),
                              blurRadius: 4.11,
                              offset: Offset(0, 0.52),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x0C7281DF),
                              blurRadius: 6.99,
                              offset: Offset(0, 1.78),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x0F7281DF),
                              blurRadius: 10.20,
                              offset: Offset(0, 4.11),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(kSize20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nama,
                              style: kPoppinsMedium.copyWith(
                                color: kBlue,
                                fontSize: kSize16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final DateTime? date =
                                        await selectDate(context);
                                    if (date != null) {
                                      monitoringBloc
                                          .add(GetDetailMonitoringEvent());
                                    }
                                  },
                                  child: Text(
                                    'Bulan 1, 2024',
                                    style: kPoppinsSemiBold.copyWith(
                                      color: kNeutral90,
                                      fontSize: kSize24,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    monitoringBloc.add(ClickChangeChartEvent());
                                  },
                                  child: Text(
                                    "Ubah Chart",
                                    style: kPoppinsMedium.copyWith(
                                      color: kBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<MonitoringBloc, MonitoringState>(
                              bloc: monitoringBloc,
                              builder: (context, state) {
                                final currentState =
                                    state as DetailMonitoringLoadedState;
                                return SizedBox(
                                  width: SizeConfig.screenWidth,
                                  height: currentState.isPie
                                      ? SizeConfig.screenHeight! * .15 * 2
                                      : SizeConfig.screenHeight! * .15,
                                  child: currentState.isPie
                                      ? Stack(
                                          children: [
                                            PieChart(
                                              PieChartData(
                                                sections: [
                                                  piecePie(
                                                      'Tepat',
                                                      monitoringRekap
                                                          .data.onTime
                                                          .toDouble(),
                                                      kGreen),
                                                  piecePie(
                                                      'Telat',
                                                      monitoringRekap.data.telat
                                                          .toDouble(),
                                                      kYellow),
                                                  piecePie(
                                                      'Absen',
                                                      monitoringRekap.data.absen
                                                          .toDouble(),
                                                      kRed),
                                                ],
                                              ),
                                            ),
                                            Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Total Presensi',
                                                    style:
                                                        kNunitoRegular.copyWith(
                                                      fontSize: kSize14,
                                                      color: kNeutral70,
                                                    ),
                                                  ),
                                                  SizedBox(height: kSize4),
                                                  Text(
                                                    "$totalPresensi",
                                                    style: kPoppinsSemiBold
                                                        .copyWith(
                                                      fontSize: kSize40,
                                                      color: kBlack,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            CardView(
                                              kata: 'On Time',
                                              value:
                                                  monitoringRekap.data.onTime,
                                              warna: kGreen,
                                            ),
                                            SizedBox(width: kSize16),
                                            CardView(
                                              kata: 'Telat',
                                              value: monitoringRekap.data.telat,
                                              warna: kYellow,
                                            ),
                                            SizedBox(width: kSize16),
                                            CardView(
                                              kata: 'Absen',
                                              value: monitoringRekap.data.absen,
                                              warna: kRed,
                                            ),
                                          ],
                                        ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: kSize24),
                      Container(
                        height: 8,
                        color: const Color(0xFFEEF2F3),
                      ),
                      SizedBox(height: kSize12),
                      Column(
                        children: monitoringDetail.data
                            .map((e) => Column(
                                  children: [
                                    SizedBox(height: kSize12),
                                    ItemDetailMonitoring(
                                        hari: e.hari,
                                        tanggal: e.tanggal,
                                        masuk: e.masuk,
                                        pulang: e.pulang,
                                        status: e.status),
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is DetailMonitoringErrorState) {
            return Text(state.pesan);
          }
          return const Text('PENANGANAN');
        },
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
      radius: 32,
      value: value,
      badgeWidget: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kBlack),
          borderRadius: BorderRadius.circular(4),
          color: warna,
        ),
        padding: EdgeInsets.all(kSize4),
        child: Text(
          "$kata: ${value.toInt()}",
          style: kNunitoRegular.copyWith(
            color: kWhite,
            fontSize: kSize14,
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
        padding: EdgeInsets.symmetric(horizontal: kSize16, vertical: kSize14),
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x087281DF),
              blurRadius: 4.11,
              offset: Offset(0, 0.52),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0C7281DF),
              blurRadius: 6.99,
              offset: Offset(0, 1.78),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0F7281DF),
              blurRadius: 10.20,
              offset: Offset(0, 4.11),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              kata,
              style: kNunitoMedium.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 3.25,
                color: kNeutral90,
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeHorizontal! * 1,
            ),
            Text(
              value.toString(),
              style: kPoppinsSemiBold.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 6.55,
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
  final String hari;
  final String tanggal;
  final String masuk;
  final String pulang;
  final String status;
  const ItemDetailMonitoring({
    super.key,
    required this.hari,
    required this.tanggal,
    required this.masuk,
    required this.pulang,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight! * .1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhite,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kSize14),
        child: Row(
          children: [
            SizedBox(
              width: SizeConfig.screenWidth! * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      hari,
                      overflow: TextOverflow.ellipsis,
                      style: kPoppinsMedium.copyWith(
                        fontSize: kSize14,
                        color: kBlack,
                      ),
                    ),
                  ),
                  SizedBox(height: kSize4),
                  Flexible(
                    child: Text(
                      tanggal,
                      overflow: TextOverflow.ellipsis,
                      style: kNunitoRegular.copyWith(
                        color: kNeutral80,
                        fontSize: kSize14,
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
                    style: kPoppinsRegular.copyWith(
                      color: kNeutral80,
                      fontSize: kSize12,
                    ),
                  ),
                  SizedBox(height: kSize4),
                  Text(
                    masuk,
                    style: kPoppinsMedium.copyWith(
                      color: kGreen,
                      fontSize: kSize16,
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
                    style: kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: kSize12,
                    ),
                  ),
                  SizedBox(height: kSize4),
                  Text(
                    pulang,
                    style: kPoppinsMedium.copyWith(
                      color: kOrange,
                      fontSize: kSize16,
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
                    style: kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: kSize12,
                    ),
                  ),
                  SizedBox(height: kSize4),
                  Text(
                    status,
                    style: kPoppinsMedium.copyWith(
                      color: status.toLowerCase() == "on time"
                          ? kGreen
                          : status.toLowerCase() == "telat"
                              ? kYellow
                              : kRed,
                      fontSize: kSize14,
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
