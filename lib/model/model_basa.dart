// To parse this JSON data, do
//
//     final basa = basaFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Basa basaFromJson(String str) => Basa.fromJson(json.decode(str));

String basaToJson(Basa data) => json.encode(data.toJson());

class Basa {
  final List<Word> words;

  Basa({
    required this.words,
  });

  factory Basa.fromJson(Map<String, dynamic> json) => Basa(
        words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "words": List<dynamic>.from(words.map((x) => x.toJson())),
      };
}

class Word {
  final String sorangan;
  final String batur;
  final String loma;
  final String bindo;
  final String english;

  Word({
    required this.sorangan,
    required this.batur,
    required this.loma,
    required this.bindo,
    required this.english,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        sorangan: json["sorangan"],
        batur: json["batur"],
        loma: json["loma"],
        bindo: json["bindo"],
        english: json["english"],
      );

  Map<String, dynamic> toJson() => {
        "sorangan": sorangan,
        "batur": batur,
        "loma": loma,
        "bindo": bindo,
        "english": english,
      };
}
