import 'dart:convert';

RekapAgendaModel rekapAgendaFromJson(String str) =>
    RekapAgendaModel.fromJson(json.decode(str));

class RekapAgendaModel {
  final bool status;
  final String code;
  final DataRekapAgendaModel data;
  final String message;

  RekapAgendaModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory RekapAgendaModel.fromJson(Map<String, dynamic> json) =>
      RekapAgendaModel(
        status: json["status"],
        code: json["code"],
        data: DataRekapAgendaModel.fromJson(json["data"]),
        message: json["message"],
      );
}

class DataRekapAgendaModel {
  final String jumlah;
  final String hadir;

  DataRekapAgendaModel({
    required this.jumlah,
    required this.hadir,
  });

  factory DataRekapAgendaModel.fromJson(Map<String, dynamic> json) =>
      DataRekapAgendaModel(
        jumlah: json["jumlah"],
        hadir: json["hadir"],
      );
}
