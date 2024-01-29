import 'package:http/http.dart' as http;
import 'package:konsumsi_api_agenda/shift/models/shift_model.dart';

import '../agenda/models/agenda-detail_model.dart';
import '../agenda/models/agenda_model.dart';
import '../gaji/models/detail_gaji_model.dart';
import '../gaji/models/gaji_model.dart';
import '../tunjangan/models/detail_tunjangan_model.dart';
import '../tunjangan/models/tunjangan_model.dart';


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
   //fetch api untuk mendapatkan semua data tunjangan atau berdasarkan bulan
  static Future<List<DataTunjangan>> fetchAPITunjangan(String date) async {
    final myResponse = await http
        .get(Uri.parse("https://dev.laz-almuthiin.com/api/tunjangan_beras?tgl=$date"));
    if (myResponse.statusCode == 200) {
      Tunjangan data = tunjanganFromJson(myResponse.body);
      return data.data;
    } else {
      throw Exception("Gagal Mengambil Data");
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
      throw Exception("Gagal Mengambil Data");
    }
  }


  //SHIFT
  static Future<JadwalShiftKerja> fetchAPIJadwalShift() async {
    final myResponse = await http.get(Uri.parse("https://dev.laz-almuthiin.com/api/jadwal_shift"));
    if(myResponse.statusCode == 200){
      //cek apakah data sudah masuk ke console
      JadwalShiftKerja result = jadwalShiftKerjaFromJson(myResponse.body);
      return result;
    }else{
      throw Exception("Gagal Mengambil Data");
    }
  }


  //GAJI
  //gaji secara keseluruhan
  static Future<Gaji> fetchAPIGaji() async {
    final myResponse = await http.get(Uri.parse('https://dev.laz-almuthiin.com/api/gaji'));
    if(myResponse.statusCode == 200){
      Gaji result = gajiFromJson(myResponse.body);
      return result;
    }else{
      throw Exception("Gagal Mengambil Data");
    }
  }

  //Detail gaji kek pengeluaran dan pemasukan
  static Future<DetailGaji> fetchAPIDetailGaji() async{
    final myResponse = await http.get(Uri.parse('https://dev.laz-almuthiin.com/api/gaji_detil'));
    if(myResponse.statusCode == 200){
      DetailGaji result = detailGajiFromJson(myResponse.body);
      return result;
    }else {
      throw Exception('Gagal Mengambil Data');
    }
  }
}
