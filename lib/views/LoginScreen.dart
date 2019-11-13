import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/viewmodel/LoginViewModel.dart';
import 'package:flutter_rosa/presenter/LoginPresenter.dart';
import 'package:flutter_rosa/interfaces/LoginInterface.dart';

final _formKey = GlobalKey<FormState>();


class Utama extends StatefulWidget {

  final LoginPresenter loginPresenter;
  Utama(this.loginPresenter,{Key key}):super(key:key);

  @override
  _UtamaState createState() => _UtamaState();
}

class _UtamaState extends State<Utama> implements LoginInterface {

  LoginViewModel loginViewModel;


  @override
  Widget build(BuildContext context) {


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

                Text(Str.login, style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),

                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                
                Visibility(
                  visible: loginViewModel.isLoginGagal,
                  child: Text(Str.login_gagal, textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent),),
                ),

                  TextFormField(
                    validator: (val){
                      if(val.isEmpty){
                        return Str.validatorRequired;
                      }
                      return null;
                    },
                    style: CSS().teksPutih(),
                    controller: loginViewModel.tecMemberID,
                    
                    decoration: InputDecoration(
                      icon: Icon(Icons.people, color: Colors.white, ),
                      labelText: Str.memberID,
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: Colors.white),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),  
                    ),
                    ),

                  TextFormField(
                    validator: (val){
                      if(val.isEmpty){
                        return Str.validatorRequired;
                      }
                      return null;
                    },
                    style: CSS().teksPutih(),
                    obscureText: true,
                    controller: loginViewModel.tecPassword,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key, color: Colors.white,),
                      labelText: Str.password,
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                    ),

                  SizedBox(
                    width: 10,
                    height: 30,
                  ),

                (loginViewModel.isLoading==false)?
                  SizedBox(
                    width: 250,
                    child: RaisedButton(
                     color: Colors.deepOrange[900],
                     elevation: 6,
                     textColor: Colors.red[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)
                      ),

                      child: Text(Str.login, style:CSS().teksPutih()),

                       onPressed: (){
                       if (_formKey.currentState.validate()){
                         this.widget.loginPresenter.doLogin(context);
                       }

                    }
              )
                  ):CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  void refreshData(LoginViewModel loginViewModel) {
    setState(() {
      this.loginViewModel=loginViewModel;
    });
  }

  @override
  void initState() {
    super.initState();
    this.widget.loginPresenter.view=this;
  }

  @override
  void loginGagal() {
    setState(() {
      loginViewModel.selesaiLoginTapiSalah();
    });
    debugPrint(Str.login_gagal);
  }

  @override
  void loginSukses() {
    setState(() {
      loginViewModel.selesaiLoginBenar();
    });
    debugPrint(Str.login_ok);
  }
}
