// To parse this JSON data, do
//
//     final monitoringRekap = monitoringRekapFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MonitoringRekap monitoringRekapFromJson(String str) =>
    MonitoringRekap.fromJson(json.decode(str));

String monitoringRekapToJson(MonitoringRekap data) =>
    json.encode(data.toJson());

class MonitoringRekap {
  final bool status;
  final String code;
  final DataMonitoringRekap data;
  final String message;

  MonitoringRekap({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory MonitoringRekap.fromJson(Map<String, dynamic> json) =>
      MonitoringRekap(
        status: json["status"],
        code: json["code"],
        data: DataMonitoringRekap.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
      };
}

class DataMonitoringRekap {
  final int onTime;
  final int absen;
  final int telat;

  DataMonitoringRekap({
    required this.onTime,
    required this.absen,
    required this.telat,
  });

  factory DataMonitoringRekap.fromJson(Map<String, dynamic> json) =>
      DataMonitoringRekap(
        onTime: json["on_time"],
        absen: json["absen"],
        telat: json["telat"],
      );

  Map<String, dynamic> toJson() => {
        "on_time": onTime,
        "absen": absen,
        "telat": telat,
      };
}
