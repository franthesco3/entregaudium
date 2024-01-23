import 'package:entregaudium/api/setup/api_provider.dart';
import 'package:entregaudium/api/setup/endpoint.dart';

abstract class ProfileRouterProtocol {
  void getProfile({required Success success, required Failure failure});
}

class ProfileRouter extends ProfileRouterProtocol {
  final api_provider = ApiProvider();

  @override
  void getProfile({required Success success, required Failure failure}) {
    final endpoint = Endpoint(path: 'perfil.php', method: Method.get);

    api_provider.request(
        endpoint: endpoint, success: success, failure: failure);
  }
}
