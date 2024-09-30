import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../data/models/monitoring.dart';
import '../../utils/monitoring_constants_finals.dart';
import '../cubit/detail_monitoring_cubit.dart';

class ItemMonitoring extends StatelessWidget {
  final DataMonitoringModel dataMonitoring;
  const ItemMonitoring({
    super.key,
    required this.dataMonitoring,
  });

  @override
  Widget build(BuildContext context) {
    final DetailMonitoringCubit detailMonitoringCubit =
        context.read<DetailMonitoringCubit>();

    return InkWell(
      onTap: () {
        detailMonitoringCubit.setNama = dataMonitoring.nama;
        Navigator.of(context).pushNamed(monitoringDetailRoute);
      },
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: boxShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
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
                          color: kBlack,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tunjangan-beras-location.svg',
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: Text(
                            dataMonitoring.lokasi,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.kPoppinsRegular.copyWith(
                              color: kNeutral80,
                              fontSize: 12,
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
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      dataMonitoring.masuk,
                      style: Styles.kPoppinsMedium.copyWith(
                        color: kGreen,
                        fontSize: 16,
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
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      dataMonitoring.pulang,
                      style: Styles.kPoppinsMedium.copyWith(
                        color: kOrange,
                        fontSize: 16,
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
