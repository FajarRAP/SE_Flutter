import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class ProfileService {
  Future<Response> getProfile() async {
    return await get(Uri.parse('$url$route${endpoint['profile']}'));
  }
}