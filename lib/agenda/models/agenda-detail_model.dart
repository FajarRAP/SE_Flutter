// To parse this JSON data, do
//
//     final agendaDetail = agendaDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AgendaDetail agendaDetailFromJson(String str) =>
    AgendaDetail.fromJson(json.decode(str));

String agendaDetailToJson(AgendaDetail data) => json.encode(data.toJson());

class AgendaDetail {
  final bool status;
  final Data data;
  final String code;
  final String message;

  AgendaDetail({
    required this.status,
    required this.data,
    required this.code,
    required this.message,
  });

  factory AgendaDetail.fromJson(Map<String, dynamic> json) => AgendaDetail(
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
  final String namaEvent;
  final String unitPengundang;
  final String tanggal;
  final String jam;
  final String lokasi;
  final String keterangan;
  final String peserta;

  Data({
    required this.namaEvent,
    required this.unitPengundang,
    required this.tanggal,
    required this.jam,
    required this.lokasi,
    required this.keterangan,
    required this.peserta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaEvent: json["nama_event"],
        unitPengundang: json["unit_pengundang"],
        tanggal: json["tanggal"],
        jam: json["jam"],
        lokasi: json["lokasi"],
        keterangan: json["Keterangan"],
        peserta: json["peserta"],
      );

  Map<String, dynamic> toJson() => {
        "nama_event": namaEvent,
        "unit_pengundang": unitPengundang,
        "tanggal": tanggal,
        "jam": jam,
        "lokasi": lokasi,
        "Keterangan": keterangan,
        "peserta": peserta,
      };
}
