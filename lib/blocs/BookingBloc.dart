import 'package:bloc/bloc.dart';
import 'package:flutter_rosa/models/booking/BaseRequestModel.dart';
import 'package:flutter_rosa/models/booking/BaseResponseModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_rosa/helpers/url.dart';

class BookingBloc extends Bloc<BaseRequestModel,BaseResponseModel>{
  @override
  BaseResponseModel get initialState => BaseResponseBegin();

  @override
  Stream<BaseResponseModel> mapEventToState(BaseRequestModel event) async* {
    yield BaseResponseLoading();
    try{
      BaseResponseModel baseResponseModel=await futureBooking(event.toJson());
      if(baseResponseModel.data.length==0){
        yield BaseResponseKosong();
      }else{
        yield BaseResponseAda();
      }

    }catch(_){
      yield BaseResponseError();
    }
  }

  static Future<BaseResponseModel> futureBooking(Map lemparan) async {
    final response = await http.post(Url.base + Url.booking, body: lemparan);
    if (response.statusCode == 200) {
      return BaseResponseModel.fromJson(json.decode(response.body));
    } else {
      return BaseResponseError();
    }
  }



}