import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';

class AuthService {
  Future<Response> authLogin(Map<String, String> body) async {
    return await post(
      Uri.parse('$url$route${endpoint['login']}'),
      body: body,
    );
  }
}
