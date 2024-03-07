import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants_finals.dart';

import 'monitoring-detail_page.dart';
import '../bloc/monitoring_bloc.dart';
import '../models/monitoring_model.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final MonitoringBloc monitoringBloc = context.read<MonitoringBloc>();

    return Scaffold(
      backgroundColor: kBlue,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              centerTitle: true,
              title: Text(
                'Monitoring',
                style: Styles.kPoppinsSemiBold.copyWith(
                  color: kWhite,
                  fontSize: Screen.kSize20,
                ),
              ),
              backgroundColor: kBlue,
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
          onRefresh: () async => monitoringBloc.add(GetMonitoringEvent()),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: Screen.height,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(Screen.kSize32)),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: Screen.kSize20,
                vertical: Screen.kSize32,
              ),
              child: BlocBuilder<MonitoringBloc, MonitoringState>(
                bloc: monitoringBloc..add(GetMonitoringEvent()),
                builder: (context, state) {
                  if (state is MonitoringLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MonitoringLoadedState) {
                    final Monitoring monitoringData = state.data;
                    // monitoringData.data.clear();
                    if (monitoringData.data.isNotEmpty) {
                      return Column(
                        children: monitoringData.data
                            .map((e) => Column(
                                  children: [
                                    ItemMonitoring(
                                      dataMonitoring: e,
                                    ),
                                    SizedBox(height: Screen.kSize8),
                                  ],
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: Screen.kSize32),
                            SvgPicture.asset(
                                'assets/icons/libur-jadwal-perkuliahan.svg'),
                            SizedBox(height: Screen.kSize24),
                            Text(
                              'Saat ini tidak ada data monitoring',
                              style: Styles.kPoppinsSemiBold.copyWith(
                                fontSize: Screen.kSize18,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(height: Screen.kSize8),
                            Text(
                              'Belum ada orang yang masuk',
                              textAlign: TextAlign.center,
                              style: Styles.kNunitoRegular.copyWith(
                                fontSize: Screen.kSize14,
                                color: kNeutral80,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => monitoringBloc.add(GetMonitoringEvent()),
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
}

class ItemMonitoring extends StatelessWidget {
  final DataMonitoring dataMonitoring;
  const ItemMonitoring({
    super.key,
    required this.dataMonitoring,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DetailMonitoringPage(
          nama: dataMonitoring.nama,
        ),
      )),
      child: Container(
        width: double.infinity,
        height: Screen.width * .18,
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Screen.kSize12),
          ),
          shadows: boxShadow,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Screen.kSize14),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        dataMonitoring.nama,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.kPoppinsMedium.copyWith(
                          fontSize: Screen.kSize14,
                          color: kBlack,
                        ),
                      ),
                    ),
                    SizedBox(height: Screen.kSize4),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/icons/tunjangan-beras-location.svg"),
                        SizedBox(width: Screen.kSize4),
                        Flexible(
                          child: Text(
                            dataMonitoring.lokasi,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.kPoppinsRegular.copyWith(
                              color: kNeutral80,
                              fontSize: Screen.kSize12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      dataMonitoring.masuk,
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
                      dataMonitoring.pulang,
                      style: Styles.kPoppinsMedium.copyWith(
                        color: kOrange,
                        fontSize: Screen.kSize16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
