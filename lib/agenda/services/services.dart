import 'package:http/http.dart' as http;
import '../models/agenda_model.dart';
import '../models/agenda-detail_model.dart';

class Services {
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
}
