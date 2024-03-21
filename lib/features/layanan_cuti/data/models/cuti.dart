import 'dart:convert';

CutiModel cutiFromJson(String str) => CutiModel.fromJson(json.decode(str));

String cutiToJson(CutiModel data) => json.encode(data.toJson());

class CutiModel {
  final bool status;
  final String code;
  final List<DataCutiModel> data;
  final String message;

  CutiModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory CutiModel.fromJson(Map<String, dynamic> json) => CutiModel(
        status: json["status"],
        code: json["code"],
        data: List<DataCutiModel>.from(
            json["data"].map((x) => DataCutiModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataCutiModel {
  String keterangan;
  String tanggalMulai;
  String tanggalSelesai;

  DataCutiModel({
    required this.keterangan,
    required this.tanggalMulai,
    required this.tanggalSelesai,
  });

  factory DataCutiModel.fromJson(Map<String, dynamic> json) => DataCutiModel(
        keterangan: json["keterangan"],
        tanggalMulai: json["tanggal_mulai"],
        tanggalSelesai: json["tanggal_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "keterangan": keterangan,
        "tanggal_mulai": tanggalMulai,
        "tanggal_selesai": tanggalSelesai,
      };
}
