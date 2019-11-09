import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/blocs/loginBloc.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';
import 'package:flutter_rosa/models/login/LoginRequestModel.dart';


bool visBtnLogin=true;

class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) => LoginBloc(),
        child: LoginScreen(),
      ) 
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  @override
  Widget build(BuildContext context) {

    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);

    void doLogin(String memberId,String password){
      LoginRequestModel loginRequestModel=LoginRequestModel(memberId:"88955969", password: "UL8OoILL");
      loginBloc..add(loginRequestModel);
    }



    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[

         LogoImage(),

          BlocBuilder<LoginBloc,LoginResponseModel>(builder: 
            (context, loginResponse) {

              if (loginResponse is Unknown){
                return RaisedButton(
                  child: Text(Str.login),
                  elevation: 6,
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  onPressed: (){
                    doLogin("", "");
                  },
                );
              }else{

                if (loginResponse.data.success==false){
                  return Column(
                    children: <Widget>[
                      Text(Str.login_gagal,
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                      RaisedButton(
                        child: Text(Str.login),
                        elevation: 6,
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                        onPressed: (){
                          doLogin("", "");
                        },
                      )
                    ],
                  );
                }else{

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(Str.login_ok),
                      RaisedButton(
                        onPressed: (){},
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(Str.lanjutkan),
                      )
                    ],
                  );
                }
              }
            }
          )
        ],
      ),

    );
  }
}


class LogoImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(image: assetImage, width: 250.0, height: 250.0,);
    return Container(child: image,);
  }
}


