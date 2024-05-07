import 'dart:convert';

Authenticated authFromJson(String str) =>
    Authenticated.fromJson(jsonDecode(str));

class Authenticated {
  final bool status;
  final String code;
  final Data data;
  final String message;

  Authenticated({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory Authenticated.fromJson(Map<String, dynamic> json) => Authenticated(
      status: json['status'],
      code: json['code'],
      data: Data.fromJson(json['data']),
      message: json['message']);
}

class Data {
  final String userId;
  final String userRealname;
  final String userEmail;
  final String userRole;
  final String accessToken;
  final String expiredTime;
  final String unitKode;

  Data({
    required this.userId,
    required this.userRealname,
    required this.userEmail,
    required this.userRole,
    required this.accessToken,
    required this.expiredTime,
    required this.unitKode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      userId: json['user_id'],
      userRealname: json['user_realname'],
      userEmail: json['user_email'],
      userRole: json['user_role'],
      accessToken: json['access_token'],
      expiredTime: json['expired_time'],
      unitKode: json['unit_kode']);
}
