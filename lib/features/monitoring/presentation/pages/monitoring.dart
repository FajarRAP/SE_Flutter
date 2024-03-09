import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants_finals.dart';

import '../cubit/monitoring_cubit.dart';
import '../widgets/item_monitoring.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MonitoringCubit monitoringCubit = context.read<MonitoringCubit>();

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
            monitoringCubit.getMonitorings();
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
            child: BlocBuilder<MonitoringCubit, MonitoringState>(
              bloc: monitoringCubit..getMonitorings(),
              builder: (context, state) {
                if (state is MonitoringLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is MonitoringLoaded) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ItemMonitoring(
                        dataMonitoring: monitoringCubit.dataMonitoring[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: Screen.kSize8,
                      );
                    },
                    itemCount: monitoringCubit.dataMonitoring.length,
                  );
                }

                if (state is MonitoringEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Screen.kSize32,
                        ),
                        SvgPicture.asset(
                          emptyDataSvg,
                        ),
                        SizedBox(
                          height: Screen.kSize24,
                        ),
                        Text(
                          'Saat ini tidak ada data monitoring',
                          style: Styles.kPoppinsSemiBold.copyWith(
                            fontSize: Screen.kSize18,
                            color: kBlack,
                          ),
                        ),
                        SizedBox(
                          height: Screen.kSize8,
                        ),
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
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      monitoringCubit.getMonitorings();
                    },
                    child: const Text('Ulangi'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
