// To parse this JSON data, do
//
//     final monitoring = monitoringFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Monitoring monitoringFromJson(String str) =>
    Monitoring.fromJson(json.decode(str));

String monitoringToJson(Monitoring data) => json.encode(data.toJson());

class Monitoring {
  final bool status;
  final String code;
  final List<DataMonitoring> data;
  final String message;

  Monitoring({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory Monitoring.fromJson(Map<String, dynamic> json) => Monitoring(
        status: json["status"],
        code: json["code"],
        data: List<DataMonitoring>.from(
            json["data"].map((x) => DataMonitoring.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataMonitoring {
  final String nipm;
  final String nama;
  final String lokasi;
  final String masuk;
  final String pulang;

  DataMonitoring({
    required this.nipm,
    required this.nama,
    required this.lokasi,
    required this.masuk,
    required this.pulang,
  });

  factory DataMonitoring.fromJson(Map<String, dynamic> json) => DataMonitoring(
        nipm: json["nipm"],
        nama: json["nama"],
        lokasi: json["lokasi"],
        masuk: json["masuk"],
        pulang: json["pulang"],
      );

  Map<String, dynamic> toJson() => {
        "nipm": nipm,
        "nama": nama,
        "lokasi": lokasi,
        "masuk": masuk,
        "pulang": pulang,
      };
}
