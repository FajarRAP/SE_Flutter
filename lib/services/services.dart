import 'package:http/http.dart' as http;

import '../agenda/models/agenda-detail_model.dart';
import '../agenda/models/agenda_model.dart';
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
      print(result);
      return result;
    } else {
      throw Exception("Gagal Mengambil Data...");
    }
  }
}
