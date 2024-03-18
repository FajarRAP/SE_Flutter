// To parse this JSON data, do
//
//     final detailGaji = detailGajiFromJson(jsonString);

import 'dart:convert';

DetailGajiModel detailGajiFromJson(String str) => DetailGajiModel.fromJson(json.decode(str));

String detailGajiToJson(DetailGajiModel data) => json.encode(data.toJson());

class DetailGajiModel {
    bool status;
    String code;
    List<DataDetailGaji> data;
    String message;

    DetailGajiModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory DetailGajiModel.fromJson(Map<String, dynamic> json) => DetailGajiModel(
        status: json["status"],
        code: json["code"],
        data: List<DataDetailGaji>.from(json["data"].map((x) => DataDetailGaji.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataDetailGaji {
    String nominal;
    String keterangan;
    String tipe;

    DataDetailGaji({
        required this.nominal,
        required this.keterangan,
        required this.tipe,
    });

    factory DataDetailGaji.fromJson(Map<String, dynamic> json) => DataDetailGaji(
        nominal: json["nominal"],
        keterangan: json["keterangan"],
        tipe: json["tipe"],
    );

    Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "keterangan": keterangan,
        "tipe": tipe,
    };
}
