import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class TunjanganService{
  Future<Response> getTunjangan(
    final String date,
  ) async {
    return await get(Uri.parse('$url$route${endpoint['tunjanganBeras']}tgl=$date'));
  }

  Future<Response> getDetailTunjangan() async {
    return await get(Uri.parse('$url$route${endpoint['detailTunjanganBeras']}'));
  }
}