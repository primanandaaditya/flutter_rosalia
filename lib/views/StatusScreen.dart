import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/StatusBloc.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/validator.dart';
import 'package:flutter_rosa/models/status/StatusRequestModel.dart';
import 'package:flutter_rosa/models/status/StatusResponseModel.dart';

final _formKey=GlobalKey<FormState>();

class StatusUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(builder: (context) => StatusBloc(),
        child: View(),
      ),
    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusBloc statusBloc = BlocProvider.of<StatusBloc>(context);

    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: CSS().gradienLinear()
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Icon(Icons.streetview, color: Colors.white, size: 100,),
              Text(Str.cekStatus, textAlign: TextAlign.center, style: CSS().judulPutih(),),
              Padding(padding: EdgeInsets.only(bottom: 20),),


              TextFormField(
                style: CSS().teksPutih(),
                controller: statusBloc.tcNoBooking,
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.casino, color: Colors.white,),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.noBooking,
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                ),
              ),


              TextFormField(
                style: CSS().teksPutih(),
                controller: statusBloc.tcHP,
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.phone, color: Colors.white,),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.nomorHP,
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                ),
              ),

              Padding(padding: EdgeInsets.only(bottom: 10),),


              RaisedButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                elevation: 6,
                shape: CSS().tombolRounded(warna: Colors.white, tebal: 18),
                child: Text(Str.submit, style: CSS().teksPutih(),),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    statusBloc.add(statusBloc.createRequest());
                  }
                },
              ),

              BlocBuilder<StatusBloc, StatusResponseModel>(
                builder: (context, response) {
                  if(response is StatusUninitialized){
                    return Container();
                  }else if(response is StatusLoading){
                    return CircularProgressIndicator();
                  }else if(response is StatusError){
                    return Text(Str.statusError, textAlign: TextAlign.center, style: CSS().teksMerah(),);
                  }else if(response is StatusSuccess){
                    return Text(Str.statusSukses, textAlign: TextAlign.center, style: CSS().teksPutih(),);
                  }else{
                    return Container();
                  }
                }
              )

            ],
          ),

        ),
      ),
    );
  }
}

