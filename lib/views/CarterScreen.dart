import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/CarterBloc.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/validator.dart';
import 'package:flutter_rosa/models/carter/CarterRequestModel.dart';
import 'package:flutter_rosa/models/carter/CarterResponseModel.dart';

final _formKey = GlobalKey<FormState>();


class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(builder: (context) => CarterBloc(),
        child: Scaffold(
          body: View(),
        ),
      );

  }
}

class View extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    CarterBloc carterBloc=BlocProvider.of<CarterBloc>(context);

    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: CSS().gradienLinear()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(Icons.directions_bus, color: Colors.white,size: 100,),
            Text(Str.carter, textAlign: TextAlign.center, style: CSS().judulPutih(),),
            Padding(padding: EdgeInsets.only(bottom: 60),),

            TextFormField(
              validator: (value){
                return Validator.validateEmpty(value);
              },
              controller: carterBloc.tcNama,
              style: CSS().teksPutih(),
              autofocus: true,
              decoration: InputDecoration(
                icon: Icon(Icons.person_outline, color: Colors.white,),
                labelText: Str.nama,
                labelStyle: CSS().teksPutih(),
                enabledBorder: CSS().garisBawahPutih(),
                focusedBorder: CSS().garisBawahPutih()
              ),
            ),


            TextFormField(
              validator: (value){
                return Validator.validateEmpty(value);
              },
              controller: carterBloc.tcTelp,
              style: CSS().teksPutih(),
              decoration: InputDecoration(
                  icon: Icon(Icons.phone, color: Colors.white,),
                  labelText: Str.nomorHP,
                  labelStyle: CSS().teksPutih(),
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih()
              ),
            ),

            TextFormField(
              validator: (value){
                return Validator.validateEmpty(value);
              },
              controller: carterBloc.tcComment,
              style: CSS().teksPutih(),
              decoration: InputDecoration(
                  icon: Icon(Icons.assignment, color: Colors.white,),
                  labelText: Str.kebutuhanCarter,
                  labelStyle: CSS().teksPutih(),
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih()
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),

            RaisedButton(
              shape: CSS().tombolRounded(warna: Colors.white, tebal: 18),
              child: Text(Str.submit),
              color: Colors.deepOrange,
              textColor: Colors.white,
              onPressed: (){
                if (_formKey.currentState.validate()){
                  carterBloc.add(carterBloc.makeRequest());
                }
              },
            ),

            BlocBuilder<CarterBloc, CarterResponseModel>(
              builder: (context, response) {

                if (response is CarterUninitialized){
                  return Container();

                }else if (response is CarterIsLoading){
                  return CircularProgressIndicator();

                }else if (response is CarterResponseModel){
                  debugPrint(response.toJson().toString());
                  return Text(
                    Str.carterStatusOK,
                    textAlign: TextAlign.center,
                    style: CSS().teksPutih(),
                  );

                }else if (response is CarterError){
                  return Text(
                    Str.carterStatusFaild,
                    textAlign: TextAlign.center,
                    style: CSS().teksPutih(),
                  );

                }else{
                  return Container();
                }
              }
            )

          ],

        ),
      ),
    );
  }
}

