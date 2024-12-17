import 'package:http/http.dart';

import '../../../../core/constants_finals.dart';
import '../../../../helper/firebase_remote_config_services.dart';

class GajiService {
  Future<Response> getGajis() async {
    return await get(
      Uri.parse('${FirebaseRemoteConfigServices().getAPIUrl()}${FirebaseRemoteConfigServices().getAPIRoute()}${endpoint['gaji']}'),
    );
  }
  Future<Response> getDetailGaji() async {
    return await get(
      Uri.parse('$url$route${endpoint['detailGaji']}'),
    );
  }
}
