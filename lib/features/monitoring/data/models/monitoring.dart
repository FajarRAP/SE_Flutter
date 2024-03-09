import 'dart:convert';

MonitoringModel monitoringFromJson(String str) =>
    MonitoringModel.fromJson(json.decode(str));

String monitoringToJson(MonitoringModel data) => json.encode(data.toJson());

class MonitoringModel {
  final bool status;
  final String code;
  final List<DataMonitoringModel> data;
  final String message;

  MonitoringModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory MonitoringModel.fromJson(Map<String, dynamic> json) =>
      MonitoringModel(
        status: json["status"],
        code: json["code"],
        data: List<DataMonitoringModel>.from(
            json["data"].map((x) => DataMonitoringModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataMonitoringModel {
  final String nipm;
  final String nama;
  final String lokasi;
  final String masuk;
  final String pulang;

  DataMonitoringModel({
    required this.nipm,
    required this.nama,
    required this.lokasi,
    required this.masuk,
    required this.pulang,
  });

  factory DataMonitoringModel.fromJson(Map<String, dynamic> json) =>
      DataMonitoringModel(
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
