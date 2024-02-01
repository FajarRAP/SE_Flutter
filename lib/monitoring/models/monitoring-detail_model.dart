// To parse this JSON data, do
//
//     final monitoringDetail = monitoringDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MonitoringDetail monitoringDetailFromJson(String str) =>
    MonitoringDetail.fromJson(json.decode(str));

String monitoringDetailToJson(MonitoringDetail data) =>
    json.encode(data.toJson());

class MonitoringDetail {
  final bool status;
  final String code;
  final List<DataMonitoringDetail> data;
  final String message;

  MonitoringDetail({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory MonitoringDetail.fromJson(Map<String, dynamic> json) =>
      MonitoringDetail(
        status: json["status"],
        code: json["code"],
        data: List<DataMonitoringDetail>.from(
            json["data"].map((x) => DataMonitoringDetail.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataMonitoringDetail {
  final String hari;
  final String tanggal;
  final String status;
  final String masuk;
  final String pulang;

  DataMonitoringDetail({
    required this.hari,
    required this.tanggal,
    required this.status,
    required this.masuk,
    required this.pulang,
  });

  factory DataMonitoringDetail.fromJson(Map<String, dynamic> json) =>
      DataMonitoringDetail(
        hari: json["hari"],
        tanggal: json["tanggal"],
        status: json["status"],
        masuk: json["masuk"],
        pulang: json["pulang"],
      );

  Map<String, dynamic> toJson() => {
        "hari": hari,
        "tanggal": tanggal,
        "status": status,
        "masuk": masuk,
        "pulang": pulang,
      };
}
