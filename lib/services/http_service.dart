import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';

class HttpService {
  Dio dio = Dio();
  static const String baseUrl =
      "https://shielded-anchorage-14639.herokuapp.com";
  String? token = LoginSharedPreferences.getUserToken() ?? '';

  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      String url = '$baseUrl$path';

      Map<String, dynamic> addquery = {};
      Map<String, dynamic> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      if (query != null) {
        addquery.addAll(query);
      }

      return await dio.get(url,
          queryParameters: addquery, options: Options(headers: headers));
    } on DioError {
      rethrow;
    }
  }

  Future<Response> post(String path, Map<String, String> request,
      {Map<String, dynamic>? query, Map<String, dynamic>? header}) async {
    try {
      final body = json.encode(request);
      String url = '$baseUrl$path';
      Map<String, dynamic> addquery = {};
      Map<String, dynamic> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        // 'Authorization': 'Bearer $token'
      };
      if (query != null) {
        addquery.addAll(query);
      }
      if (header != null) {
        headers.addAll(header);
      }

      return await dio.post(url,
          data: body,
          queryParameters: addquery,
          options: Options(headers: headers));
    } on DioError {
      rethrow;
    }
  }
}
