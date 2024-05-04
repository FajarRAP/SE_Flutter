import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class AgendaService {
  Future<Response> getAgendas(
    final String kata,
    final String tanggal,
    final bool isBerjalan,
  ) async {
    return await get(
      Uri.parse(
          '$url$route${endpoint['agenda']}key=$kata$isBerjalan&bulan=$tanggal'),
    );
  }

  Future<Response> getDetailAgenda() async {
    return await get(
      Uri.parse('$url$route${endpoint['detailAgenda']}'),
    );
  }

  Future<Response> getRekapAgenda() async {
    return await get(
      Uri.parse('$url$route${endpoint['rekapAgenda']}'),
    );
  }
}
