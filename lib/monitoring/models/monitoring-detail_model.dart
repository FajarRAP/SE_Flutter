import 'dart:convert';

MonitoringDetail monitoringDetailFromJson(String str) =>
    MonitoringDetail.fromJson(json.decode(str));

String monitoringDetailToJson(MonitoringDetail data) =>
    json.encode(data.toJson());

class MonitoringDetail {
  final bool status;
  final String code;
  final List<Datum> data;
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
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  final String hari;
  final String tanggal;
  final String status;
  final String masuk;
  final String pulang;

  Datum({
    required this.hari,
    required this.tanggal,
    required this.status,
    required this.masuk,
    required this.pulang,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
