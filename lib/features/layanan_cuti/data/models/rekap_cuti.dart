import 'dart:convert';

RekapCutiModel rekapCutiFromJson(String str) => RekapCutiModel.fromJson(json.decode(str));

String rekapCutiToJson(RekapCutiModel data) => json.encode(data.toJson());

class RekapCutiModel {
  final bool status;
  final String code;
  final DataRekapCutiModel data;
  final String message;

  RekapCutiModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory RekapCutiModel.fromJson(Map<String, dynamic> json) => RekapCutiModel(
        status: json["status"],
        code: json["code"],
        data: DataRekapCutiModel.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
      };
}

class DataRekapCutiModel {
  final String sisaCuti;
  final String cutiDiambil;
  final String totalCuti;

  DataRekapCutiModel({
    required this.sisaCuti,
    required this.cutiDiambil,
    required this.totalCuti,
  });

  factory DataRekapCutiModel.fromJson(Map<String, dynamic> json) => DataRekapCutiModel(
        sisaCuti: json["sisa_cuti"],
        cutiDiambil: json["cuti_diambil"],
        totalCuti: json["total_cuti"],
      );

  Map<String, dynamic> toJson() => {
        "sisa_cuti": sisaCuti,
        "cuti_diambil": cutiDiambil,
        "total_cuti": totalCuti,
      };
}
