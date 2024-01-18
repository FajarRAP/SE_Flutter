import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      backgroundColor: kBlue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Monitoring",
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
          // onPressed: () async {
          //   final List<Monitoring> monitoring =
          //       await Services.fetchAPIMonitoring();
          //   print(monitoring);
          // },
        ),
      ),
      body: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: Container(
            color: const Color((0xFFF6F7F9)),
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal! * 4.5,
                top: SizeConfig.blockSizeHorizontal! * 4.5,
                right: SizeConfig.blockSizeHorizontal! * 4.5,
              ),
              child: BlocBuilder<MonitoringBloc, MonitoringState>(
                bloc: monitoringBloc..add(GetMonitoringEvent()),
                builder: (context, state) {
                  if (state is MonitoringLoadingState) {
                    return SizedBox(
                      height: SizeConfig.screenHeight,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is MonitoringLoadedState) {
                    final List<Monitoring> monitoringData = state.data;
                    return Column(
                      children: monitoringData
                          .map((e) => Column(
                                children: [
                                  ItemMonitoring(
                                      nama: e.nama,
                                      lokasi: e.lokasi,
                                      masuk: e.masuk,
                                      pulang: e.pulang),
                                  SizedBox(
                                    height: SizeConfig.blockSizeHorizontal! * 2,
                                  ),
                                ],
                              ))
                          .toList(),
                    );
                  } else if (state is MonitoringErrorState) {
                    return Text("ERROR : ${state.pesan}");
                  }
                  return const Text("Gagal Mengambil Data...");
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
