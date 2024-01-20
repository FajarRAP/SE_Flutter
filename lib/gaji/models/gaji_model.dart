// To parse this JSON data, do
//
//     final gaji = gajiFromJson(jsonString);

import 'dart:convert';

List<Gaji> gajiFromJson(String str) => List<Gaji>.from(json.decode(str).map((x) => Gaji.fromJson(x)));

String gajiToJson(List<Gaji> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gaji {
    String gaji;
    String waktu;

    Gaji({
        required this.gaji,
        required this.waktu,
    });

    factory Gaji.fromJson(Map<String, dynamic> json) => Gaji(
        gaji: json["gaji"],
        waktu: json["waktu"],
    );

    Map<String, dynamic> toJson() => {
        "gaji": gaji,
        "waktu": waktu,
    };
}
