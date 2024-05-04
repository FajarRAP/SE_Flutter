// To parse this JSON data, do
//
//     final detailPresensiHariIniModel = detailPresensiHariIniModelFromJson(jsonString);

import 'dart:convert';

DetailPresensiHariIniModel detailPresensiHariIniModelFromJson(String str) => DetailPresensiHariIniModel.fromJson(json.decode(str));

String detailPresensiHariIniModelToJson(DetailPresensiHariIniModel data) => json.encode(data.toJson());

class DetailPresensiHariIniModel {
    final bool status;
    final String code;
    final Data data;
    final String message;

    DetailPresensiHariIniModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory DetailPresensiHariIniModel.fromJson(Map<String, dynamic> json) => DetailPresensiHariIniModel(
        status: json["status"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    final String hari;
    final String tanggal;
    final String jamMasuk;
    final String jamPulang;
    final String lokasi;
    final String statusPresensi;
    final String nominalInsentif;
    final String lokasiKampus;
    final String lokasiGedung;

    Data({
        required this.hari,
        required this.tanggal,
        required this.jamMasuk,
        required this.jamPulang,
        required this.lokasi,
        required this.statusPresensi,
        required this.nominalInsentif,
        required this.lokasiKampus,
        required this.lokasiGedung,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        hari: json["hari"],
        tanggal: json["tanggal"],
        jamMasuk: json["jam_masuk"],
        jamPulang: json["jam_pulang"],
        lokasi: json["lokasi"],
        statusPresensi: json["status_presensi"],
        nominalInsentif: json["nominal_insentif"],
        lokasiKampus: json["lokasi_kampus"],
        lokasiGedung: json["lokasi_gedung"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "tanggal": tanggal,
        "jam_masuk": jamMasuk,
        "jam_pulang": jamPulang,
        "lokasi": lokasi,
        "status_presensi": statusPresensi,
        "nominal_insentif": nominalInsentif,
        "lokasi_kampus": lokasiKampus,
        "lokasi_gedung": lokasiGedung,
    };
}
