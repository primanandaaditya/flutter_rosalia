import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/models/status/StatusRequestModel.dart';
import 'package:flutter_rosa/models/status/StatusResponseModel.dart';
import 'package:flutter_rosa/models/status/StatusResponseModel.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/url.dart';

class StatusBloc extends Bloc<StatusRequestModel,StatusResponseModel>{

  TextEditingController tcNoBooking=TextEditingController();
  TextEditingController tcHP=TextEditingController();

  StatusRequestModel createRequest(){
    StatusRequestModel statusRequestModel=StatusRequestModel(nobooking: tcNoBooking.text,nohp: tcHP.text);
    return statusRequestModel;
  }

  @override
  StatusResponseModel get initialState => StatusUninitialized();

  @override
  Stream<StatusResponseModel> mapEventToState(StatusRequestModel event) async* {
    yield StatusLoading();
    try{
      StatusResponseModel statusResponseModel = await futureStatus(event.toJson());
      if(statusResponseModel.status==false){
        yield StatusError();
      }else{
        yield StatusSuccess();
      }

    }catch(_){
      yield StatusError();
    }
  }

  static Future<StatusResponseModel> futureStatus(Map lemparan) async {
    final response = await http.post(Url.base + Url.status, body: lemparan);
    if (response.statusCode == 200) {
      return StatusResponseModel.fromJson(json.decode(response.body));
    } else {
      return StatusError();
    }
  }


}