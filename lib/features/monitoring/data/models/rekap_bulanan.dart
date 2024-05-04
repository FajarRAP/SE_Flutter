// To parse this JSON data, do
//
//     final rekapBulananModel = rekapBulananModelFromJson(jsonString);

import 'dart:convert';

RekapBulananModel rekapBulananModelFromJson(String str) => RekapBulananModel.fromJson(json.decode(str));

String rekapBulananModelToJson(RekapBulananModel data) => json.encode(data.toJson());

class RekapBulananModel {
    final bool status;
    final String code;
    final DataRekap data;
    final String message;

    RekapBulananModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory RekapBulananModel.fromJson(Map<String, dynamic> json) => RekapBulananModel(
        status: json["status"],
        code: json["code"],
        data: DataRekap.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
    };
}

class DataRekap {
    final String jumlahHari;
    final String jumlahTepatWaktu;
    final String jumlahTelat;
    final String jumlahAbsen;
    final String nominalInsentif;

    DataRekap({
        required this.jumlahHari,
        required this.jumlahTepatWaktu,
        required this.jumlahTelat,
        required this.jumlahAbsen,
        required this.nominalInsentif,
    });

    factory DataRekap.fromJson(Map<String, dynamic> json) => DataRekap(
        jumlahHari: json["jumlah_hari"],
        jumlahTepatWaktu: json["jumlah_tepat_waktu"],
        jumlahTelat: json["jumlah_telat"],
        jumlahAbsen: json["jumlah_absen"],
        nominalInsentif: json["nominal_insentif"],
    );

    Map<String, dynamic> toJson() => {
        "jumlah_hari": jumlahHari,
        "jumlah_tepat_waktu": jumlahTepatWaktu,
        "jumlah_telat": jumlahTelat,
        "jumlah_absen": jumlahAbsen,
        "nominal_insentif": nominalInsentif,
    };
}
