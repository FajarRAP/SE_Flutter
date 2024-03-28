import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants_finals.dart';

import '../cubit/monitoring_cubit.dart';
import '../widgets/item_monitoring.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({
    super.key,
  });

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
                  fontSize: 20,
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
            child: BlocBuilder<MonitoringCubit, MonitoringState>(
              bloc: monitoringCubit..getMonitorings(),
              builder: (context, state) {
                // Loading
                if (state is MonitoringLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Loaded
                if (state is MonitoringLoaded) {
                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ItemMonitoring(
                        dataMonitoring: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: state.data.length,
                  );
                }

                // Empty
                if (state is MonitoringEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        SvgPicture.asset(
                          emptyDataSvg,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Saat ini tidak ada data monitoring',
                          style: Styles.kPoppinsSemiBold.copyWith(
                            color: kBlack,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Belum ada orang yang masuk',
                          textAlign: TextAlign.center,
                          style: Styles.kNunitoRegular.copyWith(
                            color: kNeutral80,
                            fontSize: 14,
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
