import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
        'https://picturesfinder.live/api/v1/user/sign_in',
        data: data,
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
        'https://picturesfinder.live/api/v1/auth/login',
        data: data,
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> updateUserBibCode({
    required String accessToken,
    required String bibCode,
  }) async {
    try {
      Response response = await _dio.post(
        'https://picturesfinder.live/api/v1/user/update_bibcode?bibCode=$bibCode',
        data: '',
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getImagesByBib({
    required String bibCode,
  }) async {
    try {
      Response response = await _dio.post(
        'https://picturesfinder.live/api/v1/image/get_images_by_bibCode?bibCode=$bibCode',
        data: '',
      );
      print(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> getImagesByName({
    dynamic data,
  }) async {
    try {
      Response response = await _dio.post(
        'https://picturesfinder.live/api/v1/image/get_image_urls',
        data: data,
      );
      print(response.data.toString());
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
