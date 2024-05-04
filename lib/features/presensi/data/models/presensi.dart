import 'dart:convert';

PresensiModel presensiFromJson(String str) =>
    PresensiModel.fromJson(jsonDecode(str));

class PresensiModel {
  final bool status;
  final String code;
  final List<DataPresensi> data;
  final String message;

  PresensiModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory PresensiModel.fromJson(Map<String, dynamic> json) => PresensiModel(
      status: json['status'],
      code: json['code'],
      data: (json['data'] as List).map((e) => DataPresensi.fromJson(e)).toList(),
      message: json['message']);
}

class DataPresensi {
  final String hari;
  final String tanggal;
  final String jamMasuk;
  final String jamPulang;
  final String lokasi;
  final String statusPresensi;
  final String nominalInsentif;

  DataPresensi({
    required this.hari,
    required this.tanggal,
    required this.jamMasuk,
    required this.jamPulang,
    required this.lokasi,
    required this.statusPresensi,
    required this.nominalInsentif,
  });

  factory DataPresensi.fromJson(Map<String, dynamic> json) => DataPresensi(
      hari: json['hari'],
      tanggal: json['tanggal'],
      jamMasuk: json['jam_masuk'],
      jamPulang: json['jam_pulang'],
      lokasi: json['lokasi'],
      statusPresensi: json['status_presensi'],
      nominalInsentif: json['nominal_insentif']);
}
