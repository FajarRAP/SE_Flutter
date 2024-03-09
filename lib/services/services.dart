import 'package:http/http.dart' as http;

import '../features/gaji/data/models/detail_gaji_model.dart';
import '../features/shift/models/shift_model.dart';
import '../features/tunjangan/models/detail_tunjangan_model.dart';
import '../features/tunjangan/models/tunjangan_model.dart';

class Services {
  //TUNJANGAN
  //fetch api untuk mendapatkan semua data tunjangan atau berdasarkan bulan
  static Future<List<DataTunjangan>> fetchAPITunjangan(String date) async {
    //fetch api untuk mendapatkan semua data tunjangan
    final myResponse = await http.get(Uri.parse(
        "https://dev.laz-almuthiin.com/api/tunjangan_beras?tgl=$date"));
    if (myResponse.statusCode == 200) {
      Tunjangan data = tunjanganFromJson(myResponse.body);
      return data.data;
    } else {
      throw Exception("Gagal Mengambil Data...");
    }
  }

//fetch api untuk mendapatkan detail dari tunjangan
  static Future<DetailTunjangan> fetchAPIDetailTunjangan() async {
    final myResponse = await http.get(
        Uri.parse("https://dev.laz-almuthiin.com/api/detil_tunjangan_beras"));
    if (myResponse.statusCode == 200) {
      DetailTunjangan result = detailTunjanganFromJson(myResponse.body);
      return result;
    } else {
      throw Exception("Gagal Mengambil Data...");
    }
  }

  //SHIFT
  static Future<JadwalShiftKerja> fetchAPIJadwalShift() async {
    final myResponse = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/jadwal_shift"));
    if (myResponse.statusCode == 200) {
      //cek apakah data sudah masuk ke console
      JadwalShiftKerja result = jadwalShiftKerjaFromJson(myResponse.body);
      return result;
    } else {
      throw Exception("Gagal Mengambil Data");
    }
  }

  //Detail gaji kek pengeluaran dan pemasukan
  static Future<DetailGaji> fetchAPIDetailGaji() async {
    final myResponse = await http
        .get(Uri.parse('https://dev.laz-almuthiin.com/api/gaji_detil'));
    if (myResponse.statusCode == 200) {
      DetailGaji result = detailGajiFromJson(myResponse.body);
      return result;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }
}
