import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/models/signup/SignupRequest.dart';
import 'package:flutter_rosa/models/signup/SignupResponse.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/url.dart';
import 'dart:convert';

class SignupBloc extends Bloc<SignUpRequest,SignUpResponse>{

  TextEditingController tcSignName = TextEditingController();
  TextEditingController tcSignLahir = TextEditingController();
  TextEditingController tcSignHP = TextEditingController();
  TextEditingController tcSignEmail = TextEditingController();

  SignUpRequest makeRequest(){
    SignUpRequest signUpRequest = SignUpRequest(signName: tcSignEmail.text, signLahir: tcSignLahir.text, signHp: tcSignHP.text, signEmail: tcSignEmail.text);
    return signUpRequest;
  }

  @override
  SignUpResponse get initialState => Unknown();

  @override
  Stream<SignUpResponse> mapEventToState(SignUpRequest event) async* {
    yield IsLoading();
    try {
      SignUpResponse signUpResponse = await futureSignUp(event.toJson());
      yield signUpResponse;
    } catch (e) {
      yield ResponseError();
    }
    
  }

  static Future<SignUpResponse> futureSignUp(Map lemparan) async {

    final response = await http.post(Url.base + Url.signUp, body: lemparan);
    if (response.statusCode == 200) {
      return SignUpResponse.fromJson(json.decode(response.body));
    } else {
      return ResponseError();
    }
    
  }

  void pasangTanggal(DateTime date){
    tcSignLahir.text=date.year.toString()+"/"+date.month.toString()+"/"+date.day.toString();
  }



}