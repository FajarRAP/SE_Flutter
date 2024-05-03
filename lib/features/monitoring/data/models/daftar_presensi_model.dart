import 'dart:convert';

DaftarPresensiModel daftarPresensiModelFromJson(String str) => DaftarPresensiModel.fromJson(json.decode(str));

String daftarPresensiModelToJson(DaftarPresensiModel data) => json.encode(data.toJson());

class DaftarPresensiModel {
    final bool status;
    final String code;
    final List<DataDaftarPresensi> data;
    final String message;

    DaftarPresensiModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory DaftarPresensiModel.fromJson(Map<String, dynamic> json) => DaftarPresensiModel(
        status: json["status"],
        code: json["code"],
        data: List<DataDaftarPresensi>.from(json["data"].map((x) => DataDaftarPresensi.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataDaftarPresensi {
    final String hari;
    final String tanggal;
    final String jamMasuk;
    final String jamPulang;
    final String lokasi;
    final String statusPresensi;
    final String nominalInsentif;

    DataDaftarPresensi({
        required this.hari,
        required this.tanggal,
        required this.jamMasuk,
        required this.jamPulang,
        required this.lokasi,
        required this.statusPresensi,
        required this.nominalInsentif,
    });

    factory DataDaftarPresensi.fromJson(Map<String, dynamic> json) => DataDaftarPresensi(
        hari: json["hari"],
        tanggal: json["tanggal"],
        jamMasuk: json["jam_masuk"],
        jamPulang: json["jam_pulang"],
        lokasi: json["lokasi"],
        statusPresensi: json["status_presensi"],
        nominalInsentif: json["nominal_insentif"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "tanggal": tanggal,
        "jam_masuk": jamMasuk,
        "jam_pulang": jamPulang,
        "lokasi": lokasi,
        "status_presensi": statusPresensi,
        "nominal_insentif": nominalInsentif,
    };
}
