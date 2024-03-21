import 'dart:convert';

DetailGajiModel detailGajiFromJson(String str) => DetailGajiModel.fromJson(json.decode(str));

String detailGajiModelToJson(DetailGajiModel data) => json.encode(data.toJson());

class DetailGajiModel {
    bool status;
    String code;
    List<DataDetailGajiModel> data;
    String message;

    DetailGajiModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory DetailGajiModel.fromJson(Map<String, dynamic> json) => DetailGajiModel(
        status: json["status"],
        code: json["code"],
        data: List<DataDetailGajiModel>.from(json["data"].map((x) => DataDetailGajiModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataDetailGajiModel {
    String nominal;
    String keterangan;
    String tipe;

    DataDetailGajiModel({
        required this.nominal,
        required this.keterangan,
        required this.tipe,
    });

    factory DataDetailGajiModel.fromJson(Map<String, dynamic> json) => DataDetailGajiModel(
        nominal: json["nominal"],
        keterangan: json["keterangan"],
        tipe: json["tipe"],
    );

    Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "keterangan": keterangan,
        "tipe": tipe,
    };
}
