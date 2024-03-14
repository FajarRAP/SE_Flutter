import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class TunjanganService {
  Future<Response> getTunjangans() async {
    return await get(
      Uri.parse('$url$route${endpoint['tunjangan']}'),
    );
  }

  Future<Response> getDetailTunjangan() async {
    return await get(
      Uri.parse('$url$route${endpoint['detailTunjangan']}'),
    );
  }
}
