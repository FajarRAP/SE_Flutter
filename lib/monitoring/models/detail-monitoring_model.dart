// To parse this JSON data, do
//
//     final detailMonitoring = detailMonitoringFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DetailMonitoring detailMonitoringFromJson(String str) =>
    DetailMonitoring.fromJson(json.decode(str));

String detailMonitoringToJson(DetailMonitoring data) =>
    json.encode(data.toJson());

class DetailMonitoring {
  final int tepat;
  final int telat;
  final int absen;
  final int masuk;
  final int keluar;
  final String status;

  DetailMonitoring({
    required this.tepat,
    required this.telat,
    required this.absen,
    required this.masuk,
    required this.keluar,
    required this.status,
  });

  factory DetailMonitoring.fromJson(Map<String, dynamic> json) =>
      DetailMonitoring(
        tepat: json["tepat"],
        telat: json["telat"],
        absen: json["absen"],
        masuk: json["masuk"],
        keluar: json["keluar"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "tepat": tepat,
        "telat": telat,
        "absen": absen,
        "masuk": masuk,
        "keluar": keluar,
        "status": status,
      };
}
