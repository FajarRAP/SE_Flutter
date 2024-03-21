import 'dart:convert';

ShiftModel shiftFromJson(String str) => ShiftModel.fromJson(json.decode(str));

String shiftToJson(ShiftModel data) => json.encode(data.toJson());

class ShiftModel {
    bool status;
    String code;
    List<DataShiftModel> data;
    String message;

    ShiftModel({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory ShiftModel.fromJson(Map<String, dynamic> json) => ShiftModel(
        status: json["status"],
        code: json["code"],
        data: List<DataShiftModel>.from(json["data"].map((x) => DataShiftModel.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class DataShiftModel {
    String namaShift;
    String lokasiShift;
    String waktuShift;

    DataShiftModel({
        required this.namaShift,
        required this.lokasiShift,
        required this.waktuShift,
    });

    factory DataShiftModel.fromJson(Map<String, dynamic> json) => DataShiftModel(
        namaShift: json["nama_shift"],
        lokasiShift: json["lokasi_shift"],
        waktuShift: json["waktu_shift"],
    );

    Map<String, dynamic> toJson() => {
        "nama_shift": namaShift,
        "lokasi_shift": lokasiShift,
        "waktu_shift": waktuShift,
    };
}
