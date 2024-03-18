// To parse this JSON data, do
//
//     final gaji = gajiFromJson(jsonString);

import 'dart:convert';

Gaji gajiFromJson(String str) => Gaji.fromJson(json.decode(str));

String gajiToJson(Gaji data) => json.encode(data.toJson());

class Gaji {
    bool status;
    String code;
    List<DataGaji> data;
    String message;

    Gaji({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory Gaji.fromJson(Map<String, dynamic> json) => Gaji(
        status: json["status"],
        code: json["code"],
        data: List<DataGaji>.from(json["data"].map((x) => DataGaji.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataGaji {
    String nominal;
    String bulan;
    String bulanId;

    DataGaji({
        required this.nominal,
        required this.bulan,
        required this.bulanId,
    });

    factory DataGaji.fromJson(Map<String, dynamic> json) => DataGaji(
        nominal: json["nominal"],
        bulan: json["bulan"],
        bulanId: json["bulan_id"],
    );

    Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "bulan": bulan,
        "bulan_id": bulanId,
    };
}
