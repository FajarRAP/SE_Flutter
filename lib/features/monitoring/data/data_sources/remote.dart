import 'package:http/http.dart';

import '../../utils/monitoring_constants_finals.dart';


class MonitoringService {
  Future<Response> getMonitorings() async {
    return await get(
      Uri.parse('$url$route${endpoint['monitoring']}'),
    );
  }

  Future<Response> getRekapMonitoring() async {
    return await get(
      Uri.parse('$url$route${endpoint['rekapMonitoring']}'),
    );
  }

  Future<Response> getDetailMonitoring() async {
    return await get(
      Uri.parse('$url$route${endpoint['detailMonitoring']}'),
    );
  }
  Future<Response> getRekapBulanan() async {
    return await get(
      Uri.parse('$url$route${endpoint['rekapBulanan']}')
    );
  }
  Future<Response> getDaftarPresensi() async {
    return await get(
      Uri.parse('$url$route${endpoint['presensiDaftar']}')
    );
  }
}
