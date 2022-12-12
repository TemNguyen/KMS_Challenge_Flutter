import 'package:awesome_marathon_image/core/api_client.dart';

class HomeRepository {
  final ApiClient _apiClient;

  HomeRepository(this._apiClient);

  Future<dynamic> getImagesByBib(String bibCode) {
    return _apiClient.getImagesByBib(bibCode: bibCode);
  }

  Future<dynamic> getImagesByName(String name) {
    return _apiClient.getImagesByName(data: name);
  }
}
