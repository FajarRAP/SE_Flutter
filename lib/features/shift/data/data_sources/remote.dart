import 'package:http/http.dart';

import '../../utils/shift_constant_finals.dart';


class ShiftService {
  Future<Response> getShifts() async {
    return await get(
      Uri.parse(
        '$url$route${endpoint['shift']}',
      ),
    );
  }
}