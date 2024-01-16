// To parse this JSON data, do
//
//     final agenda = agendaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Agenda agendaFromJson(String str) => Agenda.fromJson(json.decode(str));

String agendaToJson(Agenda data) => json.encode(data.toJson());

class Agenda {
  final bool status;
  final List<Datum> data;
  final String code;
  final String message;

  Agenda({
    required this.status,
    required this.data,
    required this.code,
    required this.message,
  });

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
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
  final String idEvent;
  final String namaEvent;
  final String unitPengundang;
  final String tanggal;

  Datum({
    required this.idEvent,
    required this.namaEvent,
    required this.unitPengundang,
    required this.tanggal,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idEvent: json["id_event"],
        namaEvent: json["nama_event"],
        unitPengundang: json["unit_pengundang"],
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "id_event": idEvent,
        "nama_event": namaEvent,
        "unit_pengundang": unitPengundang,
        "tanggal": tanggal,
      };
}
