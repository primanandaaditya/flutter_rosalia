import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/helpers/url.dart';
import 'package:flutter_rosa/models/login/LoginRequestModel.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';
import 'package:flutter_rosa/viewmodel/LoginViewModel.dart';
import 'package:flutter_rosa/interfaces/LoginInterface.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPresenter{
  set view(LoginInterface value){}
  void doLogin(BuildContext buildContext){}
}

class BasicLoginPresenter implements LoginPresenter{

  LoginViewModel _loginViewModel;
  LoginInterface _loginInterface;

  BasicLoginPresenter(){
    this._loginViewModel=LoginViewModel();
  }

  @override
  void set view(LoginInterface value) {
    _loginInterface=value;
    this._loginInterface.refreshData(_loginViewModel);
  }

  @override
  void doLogin(BuildContext buildContext) {

    _loginViewModel.isLoading=true;
    LoginRequestModel loginRequestModel=LoginRequestModel(memberId: _loginViewModel.tecMemberID.text,password: _loginViewModel.tecPassword.text);
    futureLogin(loginRequestModel.toJson()).then((hasil){
      if (hasil == null){
        _loginInterface.loginGagal();
      }else{
        if(hasil.data.success==false){
          _loginInterface.loginGagal();
        }else{
          _loginInterface.loginSukses();
        }
      }
      
      
    });

    this._loginInterface.refreshData(this._loginViewModel);
   
  }

}


Future<LoginResponseModel> futureLogin(Map body) async {

  try {

    final response = await http.post(Url.base+Url.login, body: body);
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }

  
}