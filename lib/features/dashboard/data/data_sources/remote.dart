import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class DetailPresensiHariIniService{
  Future<Response> getDetailPresensiToday() async {
    return await get(Uri.parse('$url$route${endpoint['presensiToday']}'));
  }
}