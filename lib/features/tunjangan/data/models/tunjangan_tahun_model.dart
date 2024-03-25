// To parse this JSON data, do
//
//     final tunjanganTahun = tunjanganTahunFromJson(jsonString);

import 'dart:convert';

TunjanganTahunModel tunjanganTahunFromJson(String str) => TunjanganTahunModel.fromJson(json.decode(str));

String tunjanganTahunToJson(TunjanganTahunModel data) => json.encode(data.toJson());

class TunjanganTahunModel {
    bool status;
    List<DataTunjanganTahun> data;
    String code;
    String message;

    TunjanganTahunModel({
        required this.status,
        required this.data,
        required this.code,
        required this.message,
    });

    factory TunjanganTahunModel.fromJson(Map<String, dynamic> json) => TunjanganTahunModel(
        status: json["status"],
        data: List<DataTunjanganTahun>.from(json["data"].map((x) => DataTunjanganTahun.fromJson(x))),
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

class DataTunjanganTahun {
    String periode;
    String berat;
    String lokasiAmbil;
    String statusAmbil;

    DataTunjanganTahun({
        required this.periode,
        required this.berat,
        required this.lokasiAmbil,
        required this.statusAmbil,
    });

    factory DataTunjanganTahun.fromJson(Map<String, dynamic> json) => DataTunjanganTahun(
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
