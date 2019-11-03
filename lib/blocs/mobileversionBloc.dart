import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:flutter_rosa/helpers/url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rosa/helpers/str.dart';


class MobileVersionBloc extends Bloc<int,String>{

  @override
  String get initialState => Str.defaultMobileVersion;

  @override
  Stream<String> mapEventToState(int event) async* {
    try{ 
      String hasil = await getHasil();
      yield hasil; 

    }catch(_){} 
  }
}


Future<String> getHasil() async { 
  final response = await http.get(Url.base+Url.version); 
  if (response.statusCode == 200) { 
    return response.body.toString(); 
  } else { 
    throw Exception('Failed to load post'); 
  } 

} 