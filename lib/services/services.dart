import 'package:http/http.dart' as http;

import '../features/agenda/data/models/detail_agenda.dart';
import '../features/agenda/data/models/agenda.dart';
import '../features/gaji/models/detail_gaji_model.dart';
import '../features/gaji/models/gaji_model.dart';
import '../features/layanan_cuti/models/cuti-daftar_model.dart';
import '../features/layanan_cuti/models/cuti-rekap_model.dart';
import '../features/monitoring/models/monitoring-detail_model.dart';
import '../features/monitoring/models/monitoring-rekap_model.dart';
import '../features/monitoring/models/monitoring_model.dart';
import '../features/shift/models/shift_model.dart';
import '../features/tunjangan/models/detail_tunjangan_model.dart';
import '../features/tunjangan/models/tunjangan_model.dart';

class Services {
  //AGENDA
  static Future<AgendaModel> fetchAPIAgenda(
      String key, String bulan, bool isBerjalan) async {
    final response = await http.get(Uri.parse(
        "https://dev.laz-almuthiin.com/api/agenda?key=$key$isBerjalan&bulan=$bulan"));
    if (response.statusCode == 200) {
      return agendaFromJson(response.body);
    }
    throw Exception("Gagal Mengambil Data...");
  }

  static Future<DetailAgendaModel> fetchAPIDetailAgenda() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/detil_agenda"));
    if (response.statusCode == 200) {
      return detailAgendaFromJson(response.body);
    }
    throw Exception("Gagal Mengambil Data...");
  }

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

  //GAJI
  //gaji secara keseluruhan
  static Future<Gaji> fetchAPIGaji() async {
    final myResponse =
        await http.get(Uri.parse('https://dev.laz-almuthiin.com/api/gaji'));
    if (myResponse.statusCode == 200) {
      Gaji result = gajiFromJson(myResponse.body);
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

  static Future<CutiRekap> fetchAPICutiRekap() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/rekap_cuti"));
    if (response.statusCode == 200) {
      return cutiRekapFromJson(response.body);
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<CutiDaftar> fetchAPICutiTahunan() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/daftar_cuti"));
    if (response.statusCode == 200) {
      return cutiDaftarFromJson(response.body);
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<Monitoring> fetchAPIMonitoring() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/monitoring"));
    if (response.statusCode == 200) {
      return monitoringFromJson(response.body);
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<MonitoringRekap> fetchAPIMonitoringRekap() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/monitoring_rekap"));
    if (response.statusCode == 200) {
      return monitoringRekapFromJson(response.body);
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<MonitoringDetail> fetchAPIMonitoringDetail() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/monitoring_detil"));
    if (response.statusCode == 200) {
      return monitoringDetailFromJson(response.body);
    }
    throw ("Gagal Mengambil Data...");
  }
}
