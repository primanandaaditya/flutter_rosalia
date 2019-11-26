import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/models/agen/ListAgenRequest.dart';
import 'package:flutter_rosa/models/agen/ListAgenModel.dart';
import 'package:flutter_rosa/helpers/url.dart';
import 'dart:convert';

class AgenBloc extends Bloc<ListAgenRequest,String>{

  ListAgenModel listAgenModel = ListAgenModel();
  List<AgenResponseModel> filter = List();
  TextEditingController tcFilter=TextEditingController();

  @override
  String get initialState => Str.filterBegin;

  @override
  Stream<String> mapEventToState(ListAgenRequest event) async* {
    if(event is LoadAgen){
      yield Str.filterLoading;
      try{
        String hasil = await futureAgen();
        yield hasil;
      }catch(_){
        yield Str.filterError;
      }
    }else{
      yield Str.filterLoading;
      await doFilter();
      yield Str.filterTime;
    }
  }

  
  static Future<String> futureAgen() async {
    final response = await http.post(Url.base+Url.agen);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Str.filterError;
    }
  }

  Future<void> doFilter() async{
    if(tcFilter.text=="" || tcFilter.text.isEmpty){
      filter=listAgenModel.agenResponseModel;
    }else{
      filter=listAgenModel.agenResponseModel.where((t)=>t.namaAgen.toLowerCase().contains(tcFilter.text) || t.namaKota.toLowerCase().contains(tcFilter.text)).toList();
    }
  }


  void createResponse(String response){
    String result = '{"AgenResponseModel":' + response + "}";
    listAgenModel=ListAgenModel.fromJson(json.decode(result));
    listAgenModel.agenResponseModel.sort((a,b) => a.namaAgen.compareTo(b.namaAgen));
    filter=listAgenModel.agenResponseModel;
  }



}
