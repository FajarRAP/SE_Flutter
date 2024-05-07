import 'dart:convert';

ProfileModel profileFromJson(String str) =>
    ProfileModel.fromJson(jsonDecode(str));

class ProfileModel {
  final bool status;
  final String code;
  final DataProfile data;
  final String message;

  ProfileModel({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      status: json['status'],
      code: json['code'],
      data: DataProfile.fromJson(json['data']),
      message: json['message']);
}

class DataProfile {
  final String nim;
  final String nama;
  final String kodeUnit;
  final String unit;

  DataProfile({
    required this.nim,
    required this.nama,
    required this.kodeUnit,
    required this.unit,
  });

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
      nim: json['nim'],
      nama: json['nama'],
      kodeUnit: json['kode_unit'],
      unit: json['unit']);
}
