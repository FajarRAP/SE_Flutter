import 'dart:convert';

TunjanganModel tunjanganFromJson(String str) => TunjanganModel.fromJson(json.decode(str));

String tunjanganToJson(TunjanganModel data) => json.encode(data.toJson());

class TunjanganModel {
    bool status;
    List<DataTunjanganModel> data;
    String code;
    String message;

    TunjanganModel({
        required this.status,
        required this.data,
        required this.code,
        required this.message,
    });

    factory TunjanganModel.fromJson(Map<String, dynamic> json) => TunjanganModel(
        status: json["status"],
        data: List<DataTunjanganModel>.from(json["data"].map((x) => DataTunjanganModel.fromJson(x))),
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
        "message": message,
    };
}

class DataTunjanganModel {
    String periode;
    String berat;
    String lokasiAmbil;
    String statusAmbil;

    DataTunjanganModel({
        required this.periode,
        required this.berat,
        required this.lokasiAmbil,
        required this.statusAmbil,
    });

    factory DataTunjanganModel.fromJson(Map<String, dynamic> json) => DataTunjanganModel(
        periode: json["periode"],
        berat: json["berat"],
        lokasiAmbil: json["lokasi_ambil"],
        statusAmbil: json["status_ambil"],
    );

    Map<String, dynamic> toJson() => {
        "periode": periode,
        "berat": berat,
        "lokasi_ambil": lokasiAmbil,
        "status_ambil": statusAmbil,
    };
}
