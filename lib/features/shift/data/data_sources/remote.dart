import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class ShiftService {
  Future<Response> getShifts() async {
    return await get(
      Uri.parse(
        '$url$route${endpoint['shift']}',
      ),
    );
  }
}
