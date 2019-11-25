
import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rosa/models/bus/ListBusModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/url.dart';

class BusBloc extends Bloc<int,String>{


  ListBusModel listBusModel=ListBusModel();
  List<BusResponseModel> filter = List();
  TextEditingController tcFilter=TextEditingController();

  
  @override
  String get initialState => "";


  @override
  Stream<String> mapEventToState(int event) async* {

    if(event==0){

      yield "loading";
      try{
        String hasil = await futureBus();
        yield hasil;
      }catch(_){
        yield "error";
      }
    }else{
      yield "loading";
      await doFilter();
      yield "filterTime";
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

  Future<void> doFilter() async{
    if(tcFilter.text=="" || tcFilter.text.isEmpty){
      filter=listBusModel.busResponseModel;
    }else{
      filter=listBusModel.busResponseModel.where((t)=>t.namaKelas.toLowerCase().contains(tcFilter.text)).toList();
    }
  }

  void createResponse(String response){
    String result = '{"BusResponseModel":' + response + "}";
    listBusModel=ListBusModel.fromJson(json.decode(result));
    listBusModel.busResponseModel.sort((a,b) => a.namaKelas.compareTo(b.namaKelas));
    filter=listBusModel.busResponseModel;
  }




}