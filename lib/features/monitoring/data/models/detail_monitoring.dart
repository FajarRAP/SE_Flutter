import 'dart:convert';

DetailMonitoringModel detailMonitoringFromJson(String str) =>
    DetailMonitoringModel.fromJson(json.decode(str));

String detailMonitoringToJson(DetailMonitoringModel data) =>
    json.encode(data.toJson());

class DetailMonitoringModel {
  final bool status;
  final String code;
  final List<DataDetailMonitoringModel> data;
  final String message;

  DetailMonitoringModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory DetailMonitoringModel.fromJson(Map<String, dynamic> json) =>
      DetailMonitoringModel(
        status: json["status"],
        code: json["code"],
        data: List<DataDetailMonitoringModel>.from(
            json["data"].map((x) => DataDetailMonitoringModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataDetailMonitoringModel {
  final String hari;
  final String tanggal;
  final String status;
  final String masuk;
  final String pulang;

  DataDetailMonitoringModel({
    required this.hari,
    required this.tanggal,
    required this.status,
    required this.masuk,
    required this.pulang,
  });

  factory DataDetailMonitoringModel.fromJson(Map<String, dynamic> json) =>
      DataDetailMonitoringModel(
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
