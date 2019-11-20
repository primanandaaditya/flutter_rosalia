import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/helpers/url.dart';
import 'package:flutter_rosa/models/message/MessageRequestModel.dart';
import 'package:flutter_rosa/models/message/MessageResponseModel.dart';
import 'package:http/http.dart' as http;

class MessageBloc extends Bloc<MessageRequestModel,MessageResponseModel>{

  TextEditingController tcEmail = TextEditingController();
  TextEditingController tcMessage = TextEditingController();

  MessageRequestModel createRequest(){
    MessageRequestModel messageRequestModel = MessageRequestModel(email: tcEmail.text, message: tcMessage.text);
    return messageRequestModel;
  }

  @override
  MessageResponseModel get initialState => MessageUninitialized();

  @override
  Stream<MessageResponseModel> mapEventToState(MessageRequestModel event) async* {
    yield MessageLoading();
    try{
      MessageResponseModel messageResponseModel=await futureMessage(event.toJson());
      yield messageResponseModel;
    }catch(e){
      yield MessageError();
    }
  }

  static Future<MessageResponseModel> futureMessage(Map lemparan) async {
    final response = await http.post(Url.message, body: lemparan);
    if (response.statusCode == 200) {
      return MessageResponseModel.fromJson(json.decode(response.body));
    } else {
      throw MessageError;
    }
  }



}
