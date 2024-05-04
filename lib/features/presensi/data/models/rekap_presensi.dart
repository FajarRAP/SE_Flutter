import 'dart:convert';

RekapPresensiModel rekapPresensiFromJson(String str) =>
    RekapPresensiModel.fromJson(jsonDecode(str));

class RekapPresensiModel {
  final bool status;
  final String code;
  final DataRekapPresensi data;
  final String message;

  RekapPresensiModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory RekapPresensiModel.fromJson(Map<String, dynamic> json) =>
      RekapPresensiModel(
          status: json['status'],
          code: json['code'],
          data: DataRekapPresensi.fromJson(json['data']),
          message: json['message']);
}

class DataRekapPresensi {
  final String jumlahHari;
  final String jumlahTepatWaktu;
  final String jumlahTelat;
  final String jumlahAbsen;
  final String nominalInsentif;

  DataRekapPresensi({
    required this.jumlahHari,
    required this.jumlahTepatWaktu,
    required this.jumlahTelat,
    required this.jumlahAbsen,
    required this.nominalInsentif,
  });

  factory DataRekapPresensi.fromJson(Map<String, dynamic> json) =>
      DataRekapPresensi(
          jumlahHari: json['jumlah_hari'],
          jumlahTepatWaktu: json['jumlah_tepat_waktu'],
          jumlahTelat: json['jumlah_telat'],
          jumlahAbsen: json['jumlah_absen'],
          nominalInsentif: json['nominal_insentif']);
}
