import 'package:flutter_rosa/helpers/url.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LoginRepo{

  Future<LoginResponseModel> doLogin(Map body) async {
    final response = await http.post(Url.base+Url.login, body: body);
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<void> hapusToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> pertahankanToken(LoginResponseModel token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> punyaToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

}