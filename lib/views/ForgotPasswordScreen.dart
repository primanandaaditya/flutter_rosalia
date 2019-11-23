import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/ForgotPasswordBloc.dart';
import 'package:flutter_rosa/models/forgotpassword/ForgotPasswordModel.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/validator.dart';


final _formKey = GlobalKey<FormState>();

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocProvider(builder: (context) => ForgotPasswordBloc(),
        child: View(),
      )

    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ForgotPasswordBloc forgotPasswordBloc=BlocProvider.of<ForgotPasswordBloc>(context);

    return Form(
      key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: CSS().gradienLinear()
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Icon(Icons.wb_incandescent, size: 100, color: Colors.white,),
              Text(Str.forgotPassword, textAlign: TextAlign.center, style: CSS().judulPutih(),),
              Padding(
                padding: EdgeInsets.only(bottom: 60),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return Str.validatorRequired;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                  labelText: Str.memberID,
                  labelStyle: CSS().teksPutih(),
                    enabledBorder: CSS().garisBawahPutih(),
                    focusedBorder: CSS().garisBawahPutih(),
                  icon: Icon(Icons.people, color: Colors.white,)
                ),
                controller: forgotPasswordBloc.tcForgotID,
                autofocus: true,
                style: CSS().teksPutih()
              ),

              TextFormField(
                validator: (value) {
                  return Validator.validateEmail(value);
                },
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  labelText: Str.email,
                  labelStyle: CSS().teksPutih(),
                  icon: Icon(Icons.email, color: Colors.white,),
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih()
                ),
                controller: forgotPasswordBloc.tcForgotMail,
                style: CSS().teksPutih(),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),

              SizedBox(
                width: 200,
                child: RaisedButton(
                  shape: CSS().tombolRounded(warna: Colors.white, tebal: 18.0),
                  child: Text(Str.submit),
                  color: Colors.deepOrange,
                  elevation: 6,
                  textColor: Colors.white,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      forgotPasswordBloc..add(forgotPasswordBloc.createRequest());
                    }

                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 20)
              ),

              BlocBuilder<ForgotPasswordBloc, ForgotPasswordModel>(
                  builder: (context, response) {
                    if (response is Unknown){
                      return Container();
                    }else if(response is IsLoading){
                      return CircularProgressIndicator();
                    }else if(response.success==false){
                      return Text(
                        Str.forgotPasswordFail,
                        style: CSS().teksMerah(),
                        textAlign: TextAlign.center,
                      );
                    }else if(response.success==true){
                      return Text(
                        Str.forgotPasswordSuccess,
                        style: CSS().teksPutih(),
                        textAlign: TextAlign.center,
                      );
                    }else{
                      return Container();
                    }
                  }
              )


            ],
          )
        )
    );
  }
}

