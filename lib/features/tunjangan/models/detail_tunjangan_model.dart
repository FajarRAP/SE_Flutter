// To parse this JSON data, do
//
//     final detailTunjangan = detailTunjanganFromJson(jsonString);

import 'dart:convert';

DetailTunjangan detailTunjanganFromJson(String str) => DetailTunjangan.fromJson(json.decode(str));

String detailTunjanganToJson(DetailTunjangan data) => json.encode(data.toJson());

class DetailTunjangan {
    bool status;
    Data data;
    String code;
    String message;

    DetailTunjangan({
        required this.status,
        required this.data,
        required this.code,
        required this.message,
    });

    factory DetailTunjangan.fromJson(Map<String, dynamic> json) => DetailTunjangan(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "code": code,
        "message": message,
    };
}

class Data {
    String berat;
    String tglAmbil;
    String lokasiAmbil;
    String statusAmbil;
    String qrcode;

    Data({
        required this.berat,
        required this.tglAmbil,
        required this.lokasiAmbil,
        required this.statusAmbil,
        required this.qrcode,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        berat: json["berat"],
        tglAmbil: json["tgl_ambil"],
        lokasiAmbil: json["lokasi_ambil"],
        statusAmbil: json["status_ambil"],
        qrcode: json["qrcode"],
    );

    Map<String, dynamic> toJson() => {
        "berat": berat,
        "tgl_ambil": tglAmbil,
        "lokasi_ambil": lokasiAmbil,
        "status_ambil": statusAmbil,
        "qrcode": qrcode,
    };
}
