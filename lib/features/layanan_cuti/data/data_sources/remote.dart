import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class CutiService {
  Future<Response> getCutis() async {
    return await get(
      Uri.parse('$url$route${endpoint['daftarCuti']}'),
    );
  }

  Future<Response> getRekapCuti() async {
    return await get(
      Uri.parse('$url$route${endpoint['rekapCuti']}'),
    );
  }
}
