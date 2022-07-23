import 'dart:io';
import 'package:dio/dio.dart';
import 'package:thrift_project/local_storage/shared_preferences.dart';
import 'package:thrift_project/services/http_service.dart';

class LoanCollectionService {
  HttpService httpService = HttpService();
  Future<bool> collectLoan(
      String cardno, String accountno, String amountno) async {
    String? token = LoginSharedPreferences.getUserToken() ?? '';
    try {
      Response response = await httpService.post(
        header: {'Authorization': 'Bearer $token'},
        '/transaction/repayloan',
        {
          "card_number": cardno,
          "account_number": accountno,
          "amount": amountno
        },
      );
      if (response.statusCode == 200) {
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
