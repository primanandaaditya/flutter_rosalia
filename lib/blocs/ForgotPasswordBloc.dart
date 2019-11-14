import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/models/forgotpassword/ForgotPasswordModel.dart';
import 'package:flutter_rosa/models/forgotpassword/ForgotPasswordRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_rosa/helpers/url.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordRequest,ForgotPasswordModel>{

  TextEditingController tcForgotID=TextEditingController();
  TextEditingController tcForgotMail=TextEditingController();

  ForgotPasswordRequest createRequest(){
    ForgotPasswordRequest forgotPasswordRequest=ForgotPasswordRequest(forgotId: tcForgotID.text, forgotMail: tcForgotMail.text);
    return forgotPasswordRequest;
  }


  @override
  ForgotPasswordModel get initialState => Unknown();

  @override
  Stream<ForgotPasswordModel> mapEventToState(ForgotPasswordRequest event) async* {
    yield IsLoading();
    ForgotPasswordModel forgotPasswordModel=await futureForgot(event.toJson());
    yield forgotPasswordModel;

  }

  static Future<ForgotPasswordModel> futureForgot(Map lemparan) async {

    try{
      final response = await http.post(Url.base +Url.forgotPassword, body: lemparan);
      if (response.statusCode == 200) {
        return ForgotPasswordModel.fromJson(json.decode(response.body));
      } else {
        return ForgotPasswordModel(success: false,jumlah: "", message: "Error", find1: "", find2: "", find3: "", find4: "",find5: "", find6: "");
      }
    }catch(e){
      return ForgotPasswordModel(success: false,jumlah: "", message: e.toString(), find1: "", find2: "", find3: "", find4: "",find5: "", find6: "");
    }


  }


}