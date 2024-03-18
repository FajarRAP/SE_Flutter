// To parse this JSON data, do
//
//     final jadwalShiftKerja = jadwalShiftKerjaFromJson(jsonString);

import 'dart:convert';

JadwalShiftKerja jadwalShiftKerjaFromJson(String str) => JadwalShiftKerja.fromJson(json.decode(str));

String jadwalShiftKerjaToJson(JadwalShiftKerja data) => json.encode(data.toJson());

class JadwalShiftKerja {
    bool status;
    String code;
    List<DataJadwalShiftKerja> data;
    String message;

    JadwalShiftKerja({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory JadwalShiftKerja.fromJson(Map<String, dynamic> json) => JadwalShiftKerja(
        status: json["status"],
        code: json["code"],
        data: List<DataJadwalShiftKerja>.from(json["data"].map((x) => DataJadwalShiftKerja.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataJadwalShiftKerja {
    String namaShift;
    String lokasiShift;
    String waktuShift;

    DataJadwalShiftKerja({
        required this.namaShift,
        required this.lokasiShift,
        required this.waktuShift,
    });

    factory DataJadwalShiftKerja.fromJson(Map<String, dynamic> json) => DataJadwalShiftKerja(
        namaShift: json["nama_shift"],
        lokasiShift: json["lokasi_shift"],
        waktuShift: json["waktu_shift"],
    );

    Map<String, dynamic> toJson() => {
        "nama_shift": namaShift,
        "lokasi_shift": lokasiShift,
        "waktu_shift": waktuShift,
    };
}
