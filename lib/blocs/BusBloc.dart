
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_rosa/models/bus/ListBusModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/url.dart';

class BusBloc extends Bloc<int,String>{


  ListBusModel listBusModel=ListBusModel();

  @override
  String get initialState => "";



  @override
  Stream<String> mapEventToState(int event) async* {
    yield "loading";
    try{
      String hasil = await futureBus();
      yield hasil;
    }catch(_){
      yield "error";
    }
  }

  static Future<String> futureBus() async {
    final response = await http.get(Url.base+Url.bus);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "error";
    }
  }

  void createResponse(String response){
    String result = '{"BusResponseModel":' + response + "}";
    listBusModel=ListBusModel.fromJson(json.decode(result));
    listBusModel.busResponseModel.sort((a,b) => a.namaKelas.compareTo(b.namaKelas));
  }

  void filterKelas(String filter){
    
  }




}