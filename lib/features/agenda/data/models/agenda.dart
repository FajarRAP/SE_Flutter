import 'dart:convert';

AgendaModel agendaFromJson(String str) => AgendaModel.fromJson(json.decode(str));

String agendaToJson(AgendaModel data) => json.encode(data.toJson());

class AgendaModel {
  final bool status;
  final List<DataAgendaModel> data;
  final String code;
  final String message;

  AgendaModel({
    required this.status,
    required this.data,
    required this.code,
    required this.message,
  });

  factory AgendaModel.fromJson(Map<String, dynamic> json) => AgendaModel(
        status: json["status"],
        data: List<DataAgendaModel>.from(
            json["data"].map((x) => DataAgendaModel.fromJson(x))),
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

class DataAgendaModel {
  final String idEvent;
  final String namaEvent;
  final String unitPengundang;
  final String tanggal;

  DataAgendaModel({
    required this.idEvent,
    required this.namaEvent,
    required this.unitPengundang,
    required this.tanggal,
  });

  factory DataAgendaModel.fromJson(Map<String, dynamic> json) => DataAgendaModel(
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
