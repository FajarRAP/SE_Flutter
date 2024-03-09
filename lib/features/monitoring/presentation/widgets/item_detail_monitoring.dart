import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/detail_monitoring.dart';

class ItemDetailMonitoring extends StatelessWidget {
  final DataDetailMonitoringModel dataDetailMonitoringModel;
  const ItemDetailMonitoring({
    super.key,
    required this.dataDetailMonitoringModel,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOnTime =
        dataDetailMonitoringModel.status.toLowerCase() == "on time";
    final bool isTelat =
        dataDetailMonitoringModel.status.toLowerCase() == "telat";
    return Container(
      height: Screen.width * .18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Screen.kSize12,
        ),
        color: kWhite,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Screen.kSize14,
        ),
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
                      dataDetailMonitoringModel.hari,
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
                  Flexible(
                    child: Text(
                      dataDetailMonitoringModel.tanggal,
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
                  SizedBox(
                    height: Screen.kSize4,
                  ),
                  Text(
                    dataDetailMonitoringModel.masuk,
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
                  SizedBox(
                    height: Screen.kSize4,
                  ),
                  Text(
                    dataDetailMonitoringModel.pulang,
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
                  SizedBox(
                    height: Screen.kSize4,
                  ),
                  Text(
                    dataDetailMonitoringModel.status,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: isOnTime
                          ? kGreen
                          : isTelat
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
