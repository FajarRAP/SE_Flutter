import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../const_final_presensi.dart';


PieChartSectionData itemChartPie(
  final String kata,
  final double value,
  final Color warna,
) {
  return PieChartSectionData(
    color: warna,
    showTitle: false,
    radius: 32,
    value: value,
    badgeWidget: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kBlack,
        ),
        borderRadius: BorderRadius.circular(4),
        color: warna,
      ),
      padding: const EdgeInsets.all(4),
      child: Text(
        '$kata: ${value.toInt()}',
        style: Styles.kNunitoRegular.copyWith(
          color: kWhite,
          fontSize: 14,
        ),
      ),
    ),
  );
}
