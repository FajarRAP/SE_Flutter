import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';
import '../../data/models/detail_monitoring.dart';

class ItemDetailMonitoring extends StatelessWidget {
  final DataDetailMonitoringModel dataDetailMonitoring;
  const ItemDetailMonitoring({
    super.key,
    required this.dataDetailMonitoring,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOnTime =
        dataDetailMonitoring.status.toLowerCase() == "on time";
    final bool isTelat = dataDetailMonitoring.status.toLowerCase() == "telat";

    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
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
                      dataDetailMonitoring.hari,
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
                  Flexible(
                    child: Text(
                      dataDetailMonitoring.tanggal,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.kNunitoRegular.copyWith(
                        color: kNeutral80,
                        fontSize: 14,
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
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    dataDetailMonitoring.masuk,
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    dataDetailMonitoring.pulang,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: kOrange,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Status',
                    style: Styles.kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    dataDetailMonitoring.status,
                    style: Styles.kPoppinsMedium.copyWith(
                      color: isOnTime
                          ? kGreen
                          : isTelat
                              ? kYellow
                              : kRed,
                      fontSize: 13,
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
