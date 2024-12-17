import 'dart:convert';

TodayPresensiModel todayPresensiFromJson(String str) =>
    TodayPresensiModel.fromJson(jsonDecode(str));

class TodayPresensiModel {
  final bool status;
  final String code;
  final DataTodayPresensiModel data;
  final String message;

  TodayPresensiModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory TodayPresensiModel.fromJson(Map<String, dynamic> json) =>
      TodayPresensiModel(
          status: json['status'],
          code: json['code'],
          data: DataTodayPresensiModel.fromJson(json['data']),
          message: json['message']);
}

class DataTodayPresensiModel {
  final String hari;
  final String tanggal;
  final String jamMasuk;
  final String jamPulang;
  final String lokasi;
  final String statusPresensi;
  final String nominalInsentif;
  final String lokasiKampus;
  final String lokasiGedung;

  DataTodayPresensiModel({
    required this.hari,
    required this.tanggal,
    required this.jamMasuk,
    required this.jamPulang,
    required this.lokasi,
    required this.statusPresensi,
    required this.nominalInsentif,
    required this.lokasiKampus,
    required this.lokasiGedung,
  });

  factory DataTodayPresensiModel.fromJson(Map<String, dynamic> json) =>
      DataTodayPresensiModel(
          hari: json['hari'],
          tanggal: json['tanggal'],
          jamMasuk: json['jam_masuk'],
          jamPulang: json['jam_pulang'],
          lokasi: json['lokasi'],
          statusPresensi: json['status_presensi'],
          nominalInsentif: json['nominal_insentif'],
          lokasiKampus: json['lokasi_kampus'],
          lokasiGedung: json['lokasi_gedung']);
}
