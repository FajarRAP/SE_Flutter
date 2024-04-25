import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class TunjanganService {
  Future<Response> getTunjangans(final String tanggal) async {
    return await get(
      Uri.parse('$url$route${endpoint['tunjangan']}tgl=$tanggal'),
    );
  }

  Future<Response> getDetailTunjangan() async {
    return await get(
      Uri.parse('$url$route${endpoint['detailTunjangan']}'),
    );
  }
}
