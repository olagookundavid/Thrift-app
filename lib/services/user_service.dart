import 'package:dio/dio.dart';
import 'package:thrift_project/models/user_model.dart';
import 'package:thrift_project/services/http_service.dart';

class UserService {
  final HttpService _http = HttpService();

  Future<User> getUserProfile() async {
    List<User> user;
    try {
      Response response = await _http.get('path');
      if (response.statusCode == 200) {
        Map<String, dynamic> body = response.data;
        user = body['userinfo']
            .map<User>((userData) => User.fromJson(userData))
            .toList();
        return user[0];
      } else {
        throw Exception("token not valid");
      }
    } catch (e) {
      rethrow;
    }
  }
}
