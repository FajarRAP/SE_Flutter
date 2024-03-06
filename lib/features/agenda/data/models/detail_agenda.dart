import 'dart:convert';

DetailAgendaModel detailAgendaFromJson(String str) =>
    DetailAgendaModel.fromJson(json.decode(str));

String detailAgendaToJson(DetailAgendaModel data) => json.encode(data.toJson());

class DetailAgendaModel {
  final bool status;
  final DataDetailAgendaModel data;
  final String code;
  final String message;

  DetailAgendaModel({
    required this.status,
    required this.data,
    required this.code,
    required this.message,
  });

  factory DetailAgendaModel.fromJson(Map<String, dynamic> json) =>
      DetailAgendaModel(
        status: json["status"],
        data: DataDetailAgendaModel.fromJson(json["data"]),
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

class DataDetailAgendaModel {
  final String namaEvent;
  final String unitPengundang;
  final String tanggal;
  final String jam;
  final String lokasi;
  final String keterangan;
  final String peserta;

  DataDetailAgendaModel({
    required this.namaEvent,
    required this.unitPengundang,
    required this.tanggal,
    required this.jam,
    required this.lokasi,
    required this.keterangan,
    required this.peserta,
  });

  factory DataDetailAgendaModel.fromJson(Map<String, dynamic> json) =>
      DataDetailAgendaModel(
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
