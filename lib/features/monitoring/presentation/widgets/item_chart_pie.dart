import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants_finals.dart';

PieChartSectionData itemChartPie(
    final String kata,
    final double value,
    final Color warna,
  ) {
    return PieChartSectionData(
      color: warna,
      showTitle: false,
      radius: Screen.kSize32,
      value: value,
      badgeWidget: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kBlack,
          ),
          borderRadius: BorderRadius.circular(
            Screen.kSize4,
          ),
          color: warna,
        ),
        padding: EdgeInsets.all(
          Screen.kSize4,
        ),
        child: Text(
          '$kata: ${value.toInt()}',
          style: Styles.kNunitoRegular.copyWith(
            color: kWhite,
            fontSize: Screen.kSize14,
          ),
        ),
      ),
    );
  }