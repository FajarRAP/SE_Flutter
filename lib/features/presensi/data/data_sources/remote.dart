import 'package:http/http.dart';
import 'package:konsumsi_api_agenda/core/constants_finals.dart';

class PresensiService {
  Future<Response> getRekapPresensi() async {
    return await get(
      Uri.parse('$url$route${endpoint['rekapPresensi']}'),
    );
  }

  Future<Response> getTodayPresensi() async {
    return await get(
      Uri.parse('$url$route${endpoint['todayPresensi']}'),
    );
  }

  Future<Response> getDaftarPresensi() async {
    return await get(
      Uri.parse('$url$route${endpoint['daftarPresensi']}'),
    );
  }
}
