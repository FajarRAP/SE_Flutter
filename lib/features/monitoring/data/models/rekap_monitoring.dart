import 'dart:convert';

RekapMonitoringModel rekapMonitoringFromJson(String str) =>
    RekapMonitoringModel.fromJson(json.decode(str));

String rekapMonitoringToJson(RekapMonitoringModel data) =>
    json.encode(data.toJson());

class RekapMonitoringModel {
  final bool status;
  final String code;
  final DataRekapMonitoringModel data;
  final String message;

  RekapMonitoringModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory RekapMonitoringModel.fromJson(Map<String, dynamic> json) =>
      RekapMonitoringModel(
        status: json["status"],
        code: json["code"],
        data: DataRekapMonitoringModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
      };
}

class DataRekapMonitoringModel {
  final int onTime;
  final int absen;
  final int telat;

  DataRekapMonitoringModel({
    required this.onTime,
    required this.absen,
    required this.telat,
  });

  factory DataRekapMonitoringModel.fromJson(Map<String, dynamic> json) =>
      DataRekapMonitoringModel(
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
