import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:konsumsi_api_agenda/shift/models/shift_model.dart';

import '../agenda/models/agenda-detail_model.dart';
import '../agenda/models/agenda_model.dart';
import '../layanan_cuti/models/keterangan-cuti_model.dart';
import '../layanan_cuti/models/cuti-tahunan_model.dart';
import '../monitoring/models/monitoring_model.dart';
import '../monitoring/models/detail-monitoring_model.dart';
import '../tunjangan/models/detail_tunjangan_model.dart';
import '../tunjangan/models/tunjangan_model.dart';
import '../tunjangan/models/tunjangan_tahun_model.dart';

class Services {
  //AGENDA
  static Future<Agenda> fetchAPIAgenda(String key, String bulan) async {
    final response = await http.get(Uri.parse(
        "https://dev.laz-almuthiin.com/api/agenda?key=$key&bulan=$bulan"));
    if (response.statusCode == 200) {
      Agenda data = agendaFromJson(response.body);
      return data;
    }
    throw Exception("Gagal Mengambil Data");
  }

  static Future<AgendaDetail> fetchAPIAgendaDetail() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/detil_agenda"));
    if (response.statusCode == 200) {
      AgendaDetail data = agendaDetailFromJson(response.body);
      return data;
    }
    throw Exception("Gagal Mengambil Data");
  }

  //TUNJANGAN
  //fetch api untuk mendapatkan semua data tunjangan
  static Future<List<DataTunjangan>> fetchAPITunjangan() async {
    final myResponse = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/tunjangan_beras"));
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

//fetch api untuk mendapatkan tunjangan berdasarkan tahunnya.
  static Future<TunjanganTahun> fetchAPITunjanganTahun(String tahun) async {
    final myResponse = await http.get(Uri.parse(
        "https://dev.laz-almuthiin.com/api/tunjangan_beras?tgl=$tahun"));
    if (myResponse.statusCode == 200) {
      // print(myResponse.body);
      TunjanganTahun result = tunjanganTahunFromJson(myResponse.body);
      return result;
    } else {
      throw Exception("Gagal Mengambil Data...");
    }
  }

  //SHIFT
  // static Future<JadwalShiftKerja> fetchAPIJadwalShift() async {
  //   final myResponse = await http.get(Uri.parse("https://dev.laz-almuthiin.com/api/jadwal_shift"));
  //   if(myResponse.statusCode == 200){
  //     //cek apakah data sudah masuk ke console
  //     // print(myResponse.body);
  //     JadwalShiftKerja result = jadwalShiftKerjaFromJson(myResponse.body);
  //     return result;
  //   }else{
  //     throw Exception("Gagal Mengambil Data...");
  //   }
  // }

  static Future<KeteranganCuti> fetchAPIKeteranganCuti() async {
    final response = await http.get(Uri.parse(
        "https://dummy-api-ainx.000webhostapp.com/keterangan_cuti.php"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return KeteranganCuti(
          sisa: data["sisa_cuti"],
          diambil: data["cuti_diambil"],
          total: data["total_cuti"]);
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<List<CutiTahunan>> fetchAPICutiTahunan() async {
    final response = await http.get(
        Uri.parse("https://dummy-api-ainx.000webhostapp.com/cuti_tahunan.php"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((e) => CutiTahunan(
              nama: e["nama_cuti"],
              tglMulai: e["tgl_mulai"],
              tglSelesai: e["tgl_selesai"]))
          .toList();
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<List<Monitoring>> fetchAPIMonitoring() async {
    final response = await http.get(
        Uri.parse("https://dummy-api-ainx.000webhostapp.com/monitoring.php"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((e) => Monitoring(
              nama: e["nama"],
              lokasi: e["lokasi"],
              masuk: e["masuk"],
              pulang: e["pulang"]))
          .toList();
    }
    throw ("Gagal Mengambil Data...");
  }

  static Future<DetailMonitoring> fetchAPIDetailMonitoring() async {
    final response = await http.get(Uri.parse(
        "https://dummy-api-ainx.000webhostapp.com/detail_monitoring.php"));
    if (response.statusCode == 200) {
      return detailMonitoringFromJson(response.body);
    }
    throw ("Gagal Mengambil Data...");
  }
}
