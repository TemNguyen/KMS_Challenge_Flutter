import 'package:awesome_marathon_image/core/api_client.dart';

class HomeRepository {
  final ApiClient _apiClient;

  HomeRepository(this._apiClient);

  Future<List<String>> getImagesByBib(String bibCode) async {
    List<String> bibImages = [];
    var result = await _apiClient.getImagesByBib(bibCode: bibCode);
    if (result['data'] != null) {
      bibImages = List.from(result['data']);
    }
    return bibImages;
  }

  Future<List<String>> getImagesByName(String name) async {
    List<String> images = [];
    var result = await _apiClient.getImagesByName(data: name);
    if (result['data'] != null) {
      images = List.from(result['data']);
    }
    return images;
  }
}
