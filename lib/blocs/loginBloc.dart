
import 'package:flutter_rosa/models/login/LoginRequestModel.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/url.dart';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'dart:async';

class LoginBloc extends Bloc<LoginRequestModel,LoginResponseModel>{

  @override
  LoginResponseModel get initialState => Unknown() ;

  @override
  Stream<LoginResponseModel> mapEventToState(LoginRequestModel event) async* {
    try {

      LoginResponseModel loginResponseModel = await doLogin(event.toJson());
      yield loginResponseModel;

    } catch (_) {}
  }

}


Future<LoginResponseModel> doLogin(Map body) async {
  final response = await http.post(Url.base+Url.login, body: body);
  if (response.statusCode == 200) {
    return LoginResponseModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}