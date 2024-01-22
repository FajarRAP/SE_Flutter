import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'detail-monitoring_page.dart';
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
          style: kPoppinsSemiBold.copyWith(
            color: kWhite,
            fontSize: kSize20,
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
                  // monitoringData.clear();
                  if (monitoringData.isNotEmpty) {
                    return Container(
                      color: const Color((0xFFF6F7F9)),
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 4.675,
                        top: SizeConfig.blockSizeHorizontal! * 7.5,
                        right: SizeConfig.blockSizeHorizontal! * 4.675,
                        bottom: SizeConfig.blockSizeHorizontal! * 7.5,
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
                            SizedBox(height: kSize32),
                            SvgPicture.asset(
                                'assets/icons/libur-jadwal-perkuliahan.svg'),
                            SizedBox(height: kSize24),
                            Text(
                              'Saat ini tidak ada data monitoring',
                              style: kPoppinsSemiBold.copyWith(
                                fontSize: kSize18,
                                color: kBlack,
                              ),
                            ),
                            SizedBox(height: kSize8),
                            Text(
                              'Belum ada orang yang masuk',
                              textAlign: TextAlign.center,
                              style: kNunitoRegular.copyWith(
                                fontSize: kSize14,
                                color: kNeutral80,
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
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const DetailMonitoringPage(),
      )),
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight! * .1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kWhite,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth! * .04),
              child: SizedBox(
                width: SizeConfig.screenWidth! * .53,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        nama,
                        overflow: TextOverflow.ellipsis,
                        style: kPoppinsMedium.copyWith(
                          fontSize: kSize14,
                          color: kBlack,
                        ),
                      ),
                    ),
                    SizedBox(height: kSize4),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/icons/tunjangan-beras-location.svg"),
                        SizedBox(width: kSize4),
                        Flexible(
                          child: Text(
                            lokasi,
                            overflow: TextOverflow.ellipsis,
                            style: kPoppinsRegular.copyWith(
                              color: kNeutral80,
                              fontSize: kSize12,
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
              width: SizeConfig.screenWidth! * .12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              width: SizeConfig.screenWidth! * .12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
    );
  }
}
