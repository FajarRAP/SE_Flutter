// To parse this JSON data, do
//
//     final shiftBerikutnyaModel = shiftBerikutnyaModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShiftBerikutnyaModel shiftBerikutnyaModelFromJson(String str) => ShiftBerikutnyaModel.fromJson(json.decode(str));

String shiftBerikutnyaModelToJson(ShiftBerikutnyaModel data) => json.encode(data.toJson());

class ShiftBerikutnyaModel {
    final bool status;
    final String code;
    final List<DataShiftBerikutnya> data;
    final String message;

    ShiftBerikutnyaModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory ShiftBerikutnyaModel.fromJson(Map<String, dynamic> json) => ShiftBerikutnyaModel(
        status: json["status"],
        code: json["code"],
        data: List<DataShiftBerikutnya>.from(json["data"].map((x) => DataShiftBerikutnya.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataShiftBerikutnya {
    final String hari;
    final String tanggal;
    final String shiftNama;
    final String shiftMasuk;
    final String shiftPulang;
    final String lokasi;

    DataShiftBerikutnya({
        required this.hari,
        required this.tanggal,
        required this.shiftNama,
        required this.shiftMasuk,
        required this.shiftPulang,
        required this.lokasi,
    });

    factory DataShiftBerikutnya.fromJson(Map<String, dynamic> json) => DataShiftBerikutnya(
        hari: json["hari"],
        tanggal: json["tanggal"],
        shiftNama: json["shift_nama"],
        shiftMasuk: json["shift_masuk"],
        shiftPulang: json["shift_pulang"],
        lokasi: json["lokasi"],
    );

    Map<String, dynamic> toJson() => {
        "hari": hari,
        "tanggal": tanggal,
        "shift_nama": shiftNama,
        "shift_masuk": shiftMasuk,
        "shift_pulang": shiftPulang,
        "lokasi": lokasi,
    };
}
