import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/app_styles.dart';
import '../../helper/size_config.dart';
import '../../services/services.dart';
import '../bloc/monitoring_bloc.dart';
import '../models/monitoring_model.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final MonitoringBloc monitoringBloc = MonitoringBloc();
    final double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      backgroundColor: kBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Monitoring',
          style: kPoppinsBold.copyWith(
            color: kWhite,
            fontSize: SizeConfig.blockSizeHorizontal! * 4.675,
          ),
        ),
        backgroundColor: kBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kWhite,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => monitoringBloc.add(GetMonitoringEvent()),
        child: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            child: BlocBuilder<MonitoringBloc, MonitoringState>(
              bloc: monitoringBloc..add(GetMonitoringEvent()),
              builder: (context, state) {
                if (state is MonitoringLoadingState) {
                  return Container(
                    height: SizeConfig.screenHeight,
                    color: const Color((0xFFF6F7F9)),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is MonitoringLoadedState) {
                  final List<Monitoring> monitoringData = state.data;
                  if (monitoringData.isNotEmpty) {
                    return Container(
                      color: const Color((0xFFF6F7F9)),
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 4.5,
                        top: SizeConfig.blockSizeHorizontal! * 4.5,
                        right: SizeConfig.blockSizeHorizontal! * 4.5,
                      ),
                      child: Column(
                        children: monitoringData
                            .map((e) => Column(
                                  children: [
                                    ItemMonitoring(
                                        nama: e.nama,
                                        lokasi: e.lokasi,
                                        masuk: e.masuk,
                                        pulang: e.pulang),
                                    SizedBox(
                                      height:
                                          SizeConfig.blockSizeHorizontal! * 2,
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    );
                  } else {
                    return Container(
                      color: const Color((0xFFF6F7F9)),
                      height: SizeConfig.screenHeight! - appBarHeight,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 32),
                            SvgPicture.asset(
                                'assets/icons/libur-jadwal-perkuliahan.svg'),
                            const SizedBox(height: 24),
                            Text(
                              'Saat ini tidak ada data monitoring',
                              style: kPoppinsSemiBold.copyWith(
                                fontSize: 18,
                                color: kBlack,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Belum ada orang yang masuk',
                              textAlign: TextAlign.center,
                              style: kNunitoRegular.copyWith(
                                fontSize: 14,
                                color: kNeutral90,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return const Text("Gagal Mengambil Data...");
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ItemMonitoring extends StatelessWidget {
  final String nama;
  final String lokasi;
  final String masuk;
  final String pulang;
  const ItemMonitoring({
    super.key,
    required this.nama,
    required this.lokasi,
    required this.masuk,
    required this.pulang,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight! * .09,
        color: kWhite,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth! * .04),
              child: SizedBox(
                width: SizeConfig.screenWidth! * .45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        nama,
                        overflow: TextOverflow.ellipsis,
                        style: kPoppinsBold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: kRed,
                        ),
                        Flexible(
                          child: Text(
                            lokasi,
                            overflow: TextOverflow.ellipsis,
                            style: kPoppinsMedium.copyWith(
                              color: kGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(),
            SizedBox(
              width: SizeConfig.screenWidth! * .16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Masuk",
                    style: kPoppinsMedium.copyWith(
                      color: kGrey,
                    ),
                  ),
                  Text(
                    masuk,
                    style: kPoppinsMedium.copyWith(
                      color: kGreen,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            SizedBox(
              width: SizeConfig.screenWidth! * .16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pulang",
                    style: kPoppinsMedium.copyWith(
                      color: kGrey,
                    ),
                  ),
                  Text(
                    pulang,
                    style: kPoppinsMedium.copyWith(
                      color: kGreen,
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
