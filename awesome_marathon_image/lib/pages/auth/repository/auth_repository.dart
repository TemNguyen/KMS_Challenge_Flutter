import 'package:awesome_marathon_image/core/api_client.dart';

class AuthRepository {
  final ApiClient _api;

  AuthRepository(this._api);

  Future<dynamic> login(String username, String pw) {
    Map<String, dynamic> userData = {
      "username": username,
      "password": pw,
    };
    return _api.login(userData);
  }

  Future<dynamic> register(String username, String pw, String fullname) {
    Map<String, dynamic> userData = {
      "username": username,
      "password": pw,
      "fullname": fullname,
    };
    return _api.registerUser(userData);
  }
}
