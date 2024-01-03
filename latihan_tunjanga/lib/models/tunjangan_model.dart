// To parse this JSON data, do
//
//     final tunjangan = tunjanganFromJson(jsonString);

import 'dart:convert';

Tunjangan tunjanganFromJson(String str) => Tunjangan.fromJson(json.decode(str));

String tunjanganToJson(Tunjangan data) => json.encode(data.toJson());

class Tunjangan {
    bool status;
    List<Datum> data;
    String code;
    String message;

    Tunjangan({
        required this.status,
        required this.data,
        required this.code,
        required this.message,
    });

    factory Tunjangan.fromJson(Map<String, dynamic> json) => Tunjangan(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
    };
}

class Datum {
    String periode;
    String berat;
    String lokasiAmbil;
    String statusAmbil;

    Datum({
        required this.periode,
        required this.berat,
        required this.lokasiAmbil,
        required this.statusAmbil,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        periode: json["periode"],
        berat: json["berat"],
        lokasiAmbil: json["lokasi_ambil"],
        statusAmbil: json["status_ambil"],
    );

    Map<String, dynamic> toJson() => {
        "periode": periode,
        "berat": berat,
        "lokasi_ambil": lokasiAmbil,
        "status_ambil": statusAmbil,
    };
}
