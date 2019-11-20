import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/blocs/LoginBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/helpers/validator.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';

final _formKey = GlobalKey<FormState>();

class LoginUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocProvider(builder: (context) => LoginBloc(),
        child: View(),
      )
,
    );
  }
}

class View extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    return 
       Scaffold(

        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              gradient: CSS().gradienLinear()
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[



                Icon(
                  Icons.assignment_ind,
                  color: Colors.white,
                  size: 100,
                ),

                Text(Str.login, style: CSS().judulPutih()),

                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                ),
                
              
                  TextFormField(
                    validator: (val){
                      return Validator.validateEmpty(val);
                    },
                    style: CSS().teksPutih(),
                    controller: loginBloc.tcMemberID,
                    autofocus: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.people, color: Colors.white, ),
                      labelText: Str.memberID,
                      labelStyle: CSS().teksPutih(),
                      enabledBorder: CSS().garisBawahPutih(),
                      focusedBorder: CSS().garisBawahPutih(),
                    ),
                    ),

                  TextFormField(
                    validator: (val){
                      return Validator.validateEmpty(val);
                    },
                    style: CSS().teksPutih(),
                    obscureText: true,
                    controller: loginBloc.tcPassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key, color: Colors.white,),
                      labelText: Str.password,
                      labelStyle: CSS().teksPutih(),
                      enabledBorder: CSS().garisBawahPutih(),
                      focusedBorder: CSS().garisBawahPutih()
                    ),
                    ),

                  SizedBox(
                    width: 10,
                    height: 30,
                  ),

                  RaisedButton(
                    color: Colors.deepOrange,
                    child: Text(Str.login),
                    textColor: Colors.white,
                    elevation: 6,
                    shape: CSS().tombolRounded(warna: Colors.white, tebal: 18),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        loginBloc.add(loginBloc.createRequest());
                      }
                    },

                  ),

                  BlocBuilder<LoginBloc, LoginResponseModel>(
                    builder: (context, response) {

                      if(response is LoginUninitialized){
                        return Container();
                      }else if(response is LoginLoading){
                        return CircularProgressIndicator(backgroundColor: Colors.white,);
                      }else if(response is LoginSuccess){
                        return Text(Str.login_ok,style: CSS().teksPutih(),);
                      }else if(response is LoginError){
                        return Text(Str.login_gagal, style: CSS().teksMerah(),);
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
