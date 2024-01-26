// To parse this JSON data, do
//
//     final cutiRekap = cutiRekapFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CutiRekap cutiRekapFromJson(String str) => CutiRekap.fromJson(json.decode(str));

String cutiRekapToJson(CutiRekap data) => json.encode(data.toJson());

class CutiRekap {
    final bool status;
    final String code;
    final DataCutiRekap data;
    final String message;

    CutiRekap({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory CutiRekap.fromJson(Map<String, dynamic> json) => CutiRekap(
        status: json["status"],
        code: json["code"],
        data: DataCutiRekap.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
    };
}

class DataCutiRekap {
    final String sisaCuti;
    final String cutiDiambil;
    final String totalCuti;

    DataCutiRekap({
        required this.sisaCuti,
        required this.cutiDiambil,
        required this.totalCuti,
    });

    factory DataCutiRekap.fromJson(Map<String, dynamic> json) => DataCutiRekap(
        sisaCuti: json["sisa_cuti"],
        cutiDiambil: json["cuti_diambil"],
        totalCuti: json["total_cuti"],
    );

    Map<String, dynamic> toJson() => {
        "sisa_cuti": sisaCuti,
        "cuti_diambil": cutiDiambil,
        "total_cuti": totalCuti,
    };
}
