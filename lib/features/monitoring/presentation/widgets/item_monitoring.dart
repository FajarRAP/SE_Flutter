import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/monitoring.dart';
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
        Navigator.of(context).pushNamed(monitoringDetailRoute);
        detailMonitoringCubit.setNama = dataMonitoring.nama;
      },
      child: Container(
        width: double.infinity,
        height: Screen.width * .18,
        decoration: ShapeDecoration(
          color: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Screen.kSize12,
            ),
          ),
          shadows: boxShadow,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Screen.kSize14,
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
                          fontSize: Screen.kSize14,
                          color: kBlack,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screen.kSize4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tunjangan-beras-location.svg',
                        ),
                        SizedBox(
                          width: Screen.kSize4,
                        ),
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
                    SizedBox(
                      height: Screen.kSize4,
                    ),
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
                    SizedBox(
                      height: Screen.kSize4,
                    ),
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
