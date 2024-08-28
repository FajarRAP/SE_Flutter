
// ignore: unused_import
import 'package:meta/meta.dart';
import 'dart:convert';

PresensiDetilModel presensiDetilModelFromJson(String str) => PresensiDetilModel.fromJson(json.decode(str));

String presensiDetilModelToJson(PresensiDetilModel data) => json.encode(data.toJson());

class PresensiDetilModel {
    final bool status;
    final String code;
    final DataPresensiDetil data;
    final String message;

    PresensiDetilModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory PresensiDetilModel.fromJson(Map<String, dynamic> json) => PresensiDetilModel(
        status: json["status"],
        code: json["code"],
        data: DataPresensiDetil.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
    };
}

class DataPresensiDetil {
    final String hari;
    final String tanggal;
    final String jamMasuk;
    final String jamPulang;
    final String lokasi;
    final String nominalInsentif;
    final String statusTombol;
    final String statusAksi;

    DataPresensiDetil({
        required this.hari,
        required this.tanggal,
        required this.jamMasuk,
        required this.jamPulang,
        required this.lokasi,
        required this.nominalInsentif,
        required this.statusTombol,
        required this.statusAksi,
    });

    factory DataPresensiDetil.fromJson(Map<String, dynamic> json) => DataPresensiDetil(
        hari: json["hari"],
        tanggal: json["tanggal"],
        jamMasuk: json["jam_masuk"],
        jamPulang: json["jam_pulang"],
        lokasi: json["lokasi"],
        nominalInsentif: json["nominal_insentif"],
        statusTombol: json["status_tombol"],
        statusAksi: json["status_aksi"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "tanggal": tanggal,
        "jam_masuk": jamMasuk,
        "jam_pulang": jamPulang,
        "lokasi": lokasi,
        "nominal_insentif": nominalInsentif,
        "status_tombol": statusTombol,
        "status_aksi": statusAksi,
    };
}
