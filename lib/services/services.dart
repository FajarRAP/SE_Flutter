import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:konsumsi_api_agenda/shift/models/shift_model.dart';

import '../agenda/models/agenda-detail_model.dart';
import '../agenda/models/agenda_model.dart';
import '../layanan_cuti/models/cuti-rekap_model.dart';
import '../layanan_cuti/models/cuti-daftar_model.dart';
import '../monitoring/models/monitoring_model.dart';
import '../monitoring/models/monitoring-detail_model.dart';
import '../monitoring/models/monitoring-rekap_model.dart';
import '../tunjangan/models/detail_tunjangan_model.dart';
import '../tunjangan/models/tunjangan_model.dart';
import '../tunjangan/models/tunjangan_tahun_model.dart';

class Services {
  //AGENDA
  static Future<Agenda> fetchAPIAgenda(String key, String bulan) async {
    final response = await http.get(Uri.parse(
        "https://dev.laz-almuthiin.com/api/agenda?key=$key&bulan=$bulan"));
    if (response.statusCode == 200) {
      return agendaFromJson(response.body);
    }
    throw Exception("Gagal Mengambil Data");
  }

  static Future<AgendaDetail> fetchAPIAgendaDetail() async {
    final response = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/detil_agenda"));
    if (response.statusCode == 200) {
      return agendaDetailFromJson(response.body);
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
