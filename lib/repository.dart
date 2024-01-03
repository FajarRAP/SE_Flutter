import 'package:konsumsi_api_bloc/api_provider.dart';
import 'package:konsumsi_api_bloc/model/model_basa.dart';

class Repository {
  ApiProvider service = ApiProvider();

  Future<Basa> konsumsiAPI() => service.konsumsiAPI();
}
