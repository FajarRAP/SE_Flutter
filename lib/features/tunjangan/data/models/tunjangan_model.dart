// To parse this JSON data, do
//
//     final tunjangan = tunjanganFromJson(jsonString);

import 'dart:convert';

TunjanganModel tunjanganFromJson(String str) => TunjanganModel.fromJson(json.decode(str));

String tunjanganToJson(TunjanganModel data) => json.encode(data.toJson());

class TunjanganModel {
    bool status;
    List<DataTunjangan> data;
    String code;
    String message;

    TunjanganModel({
        required this.status,
        required this.data,
        required this.code,
        required this.message,
    });

    factory TunjanganModel.fromJson(Map<String, dynamic> json) => TunjanganModel(
        status: json["status"],
        data: List<DataTunjangan>.from(json["data"].map((x) => DataTunjangan.fromJson(x))),
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

class DataTunjangan {
    String periode;
    String berat;
    String lokasiAmbil;
    String statusAmbil;

    DataTunjangan({
        required this.periode,
        required this.berat,
        required this.lokasiAmbil,
        required this.statusAmbil,
    });

    factory DataTunjangan.fromJson(Map<String, dynamic> json) => DataTunjangan(
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
