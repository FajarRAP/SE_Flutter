// To parse this JSON data, do
//
//     final cutiDaftar = cutiDaftarFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CutiDaftar cutiDaftarFromJson(String str) =>
    CutiDaftar.fromJson(json.decode(str));

String cutiDaftarToJson(CutiDaftar data) => json.encode(data.toJson());

class CutiDaftar {
  final bool status;
  final String code;
  final List<DataCutiDaftar> data;
  final String message;

  CutiDaftar({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory CutiDaftar.fromJson(Map<String, dynamic> json) => CutiDaftar(
        status: json["status"],
        code: json["code"],
        data: List<DataCutiDaftar>.from(
            json["data"].map((x) => DataCutiDaftar.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataCutiDaftar {
  final String keterangan;
  final String tanggalMulai;
  final String tanggalSelesai;

  DataCutiDaftar({
    required this.keterangan,
    required this.tanggalMulai,
    required this.tanggalSelesai,
  });

  factory DataCutiDaftar.fromJson(Map<String, dynamic> json) => DataCutiDaftar(
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
