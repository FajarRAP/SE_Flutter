// To parse this JSON data, do
//
//     final detailTunjangan = detailTunjanganFromJson(jsonString);

import 'dart:convert';

DetailTunjanganModel detailTunjanganFromJson(String str) => DetailTunjanganModel.fromJson(json.decode(str));

String detailTunjanganToJson(DetailTunjanganModel data) => json.encode(data.toJson());

class DetailTunjanganModel {
    bool status;
    DataDetailTunjangan data;
    String code;
    String message;

    DetailTunjanganModel({
        required this.status,
        required this.data,
        required this.code,
        required this.message,
    });

    factory DetailTunjanganModel.fromJson(Map<String, dynamic> json) => DetailTunjanganModel(
        status: json["status"],
        data: DataDetailTunjangan.fromJson(json["data"]),
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

class DataDetailTunjangan {
    String berat;
    String tglAmbil;
    String lokasiAmbil;
    String statusAmbil;
    String qrcode;

    DataDetailTunjangan({
        required this.berat,
        required this.tglAmbil,
        required this.lokasiAmbil,
        required this.statusAmbil,
        required this.qrcode,
    });

    factory DataDetailTunjangan.fromJson(Map<String, dynamic> json) => DataDetailTunjangan(
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

    bool get isNotEmpty {
        return [berat, tglAmbil, lokasiAmbil, statusAmbil, qrcode].any((element) => element.isNotEmpty);
    }
}
