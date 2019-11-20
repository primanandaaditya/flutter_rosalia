
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/models/login/LoginRequestModel.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/url.dart';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'dart:async';

class LoginBloc extends Bloc<LoginRequestModel,LoginResponseModel>{

  TextEditingController tcMemberID=TextEditingController();
  TextEditingController tcPassword=TextEditingController();

  LoginRequestModel createRequest(){
    LoginRequestModel loginRequestModel = LoginRequestModel(memberId: tcMemberID.text,password: tcPassword.text);
    return loginRequestModel;
  }

  @override
  LoginResponseModel get initialState => LoginUninitialized() ;

  @override
  Stream<LoginResponseModel> mapEventToState(LoginRequestModel event) async* {
    yield LoginLoading();
    try {

      LoginResponseModel loginResponseModel = await doLogin(event.toJson());
      if(loginResponseModel.data.data==null){
        yield LoginError();
      }else{
        yield LoginSuccess();
      }

    } catch (_) {
      yield LoginError();
    }
  }

}


Future<LoginResponseModel> doLogin(Map body) async {
  final response = await http.post(Url.base+Url.login, body: body);
  if (response.statusCode == 200) {
   return LoginResponseModel.fromJson(json.decode(response.body));
  } else {
    return LoginError();
  }
}