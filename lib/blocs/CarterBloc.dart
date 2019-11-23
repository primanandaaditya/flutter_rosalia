import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/helpers/url.dart';
import 'package:flutter_rosa/models/carter/CarterRequestModel.dart';
import 'package:flutter_rosa/models/carter/CarterResponseModel.dart';
import 'package:http/http.dart' as http;


class CarterBloc extends Bloc<CarterRequestModel,CarterResponseModel>{

  TextEditingController tcNama = TextEditingController();
  TextEditingController tcTelp = TextEditingController();
  TextEditingController tcComment = TextEditingController();

  CarterRequestModel makeRequest(){
    CarterRequestModel carterRequestModel = CarterRequestModel(nama: tcNama.text,telp: tcTelp.text,comment: tcComment.text, tipe: "");
    return carterRequestModel;
  }

  @override
  CarterResponseModel get initialState => CarterUninitialized();

  @override
  Stream<CarterResponseModel> mapEventToState(CarterRequestModel event) async* {
    yield CarterIsLoading();
    try {
       CarterResponseModel carterResponseModel = await futureCarter(event.toJson());
       yield carterResponseModel;
    } catch (e) {
      yield CarterError();
    }
  }

  
  static Future<CarterResponseModel> futureCarter(Map lemparan) async {
    final response = await http.post(Url.carter, body: lemparan);
    if (response.statusCode == 200) {
      return CarterResponseModel.fromJson(json.decode(response.body));
    } else {
      return CarterError();
    }
  }

}

