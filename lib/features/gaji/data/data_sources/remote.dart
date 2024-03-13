import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class GajiService {
  Future<Response> getGajis() async {
    return await get(
      Uri.parse('$url$route${endpoint['gaji']}'),
    );
  }

  Future<Response> getDetailGaji() async {
    return await get(
      Uri.parse('$url$route${endpoint['detailGaji']}'),
    );
  }
}
