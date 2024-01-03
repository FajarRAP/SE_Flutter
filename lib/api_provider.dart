import 'dart:convert';

import 'package:http/http.dart';
import 'package:konsumsi_api_bloc/model/model_basa.dart';

class ApiProvider {
  Client client = Client();
  final _baseurl = "https://hibersunda.onrender.com/undakusukbasa";

  Future<Basa> konsumsiAPI() async {
    final response = await client.get(Uri.parse(_baseurl));

    if (response.statusCode == 200) {
      return Basa.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal Konsumsi API");
    }
  }
}
