import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class PresensiService {
  Future<Response> getShiftBerikutnyas() async {
    return await get(
      Uri.parse('$url$route${endpoint['presensiShift']}')
    );
  }
}