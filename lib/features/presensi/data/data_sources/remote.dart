import 'package:http/http.dart';


class PresensiService {
  final String url = 'http://d3v.uad.id/';
  final String route = 'ipm/index.php/auth/';
  final Map<String, String> endpoint = {
    'rekapBulanan': 'rekap_presensi',
    'todayPresensi': 'presensi_today',
    'daftarPresensi': 'presensi_daftar',
    'presensiShift': 'presensi_shift',
    'presensiDetil': 'presensi_detil',
  };

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

  Future<Response> getShiftBerikutnyas() async {
    return await get(Uri.parse('$url$route${endpoint['presensiShift']}'));
  }

  Future<Response> getPresensiDetil() async {
    return await get(Uri.parse('$url$route${endpoint['presensiDetil']}'));
  }
}
