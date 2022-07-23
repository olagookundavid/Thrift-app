import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'package:thrift_project/services/http_service.dart';

class Auth {
  HttpService httpService = HttpService();
  Future<bool> signIn(String email, String password) async {
    try {
      Response response = await httpService.post(
        '/signin',
        {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(jsonEncode(response.data));
        String token = data['token'];
        await LoginSharedPreferences.setUserToken(token);
        return true;
      }
      return false;
    } on SocketException {
      rethrow;
    } catch (e) {
      return false;
    }
  }
}
