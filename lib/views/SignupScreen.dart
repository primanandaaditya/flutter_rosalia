import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/blocs/SignupBloc.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/models/signup/SignupRequest.dart';
import 'package:flutter_rosa/models/signup/SignupResponse.dart';
import 'package:flutter_rosa/helpers/validator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

final _formKey = GlobalKey<FormState>();


class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(builder: (context) => SignupBloc(),
        child: View(),
      )

    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SignupBloc signupBloc = BlocProvider.of<SignupBloc>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: CSS().gradienLinear()
      ),
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

            Icon(Icons.supervised_user_circle, color: Colors.white, size: 100, ),
            Text(Str.signUp, textAlign: TextAlign.center, style: CSS().judulPutih(),),
            Padding(padding: EdgeInsets.only(bottom: 60),),

            TextFormField(
              validator: (value){
                return Validator.validateEmpty(value);
              },
              controller: signupBloc.tcSignName,
              autofocus: true,
              decoration: InputDecoration(
                labelText: Str.nama,
                labelStyle: CSS().teksPutih(),
                enabledBorder: CSS().garisBawahPutih(),
                focusedBorder: CSS().garisBawahPutih(),
                icon: Icon(Icons.accessibility_new, color: Colors.white,)
              ),
              style: CSS().teksPutih(),
            ),

            TextFormField(
              validator: (value){
                return Validator.validateEmail(value);
              },
              keyboardType: TextInputType.emailAddress,
              controller: signupBloc.tcSignEmail,
              decoration: InputDecoration(
                  labelText: Str.email,
                  labelStyle: CSS().teksPutih(),
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  icon: Icon(Icons.email, color: Colors.white,)
              ),
              style: CSS().teksPutih(),
            ),

            TextFormField(
              validator: (value){
                return Validator.validateEmpty(value);
              },
              controller: signupBloc.tcSignHP,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: Str.nomorHP,
                  labelStyle: CSS().teksPutih(),
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  icon: Icon(Icons.phone, color: Colors.white,)
              ),
              style: CSS().teksPutih(),
            ),

            TextFormField(
              validator: (value){
                return Validator.validateEmpty(value);
              },
              controller: signupBloc.tcSignLahir,
              decoration: InputDecoration(
                  labelText: Str.tanggalLahir,
                  labelStyle: CSS().teksPutih(),
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  icon: Icon(Icons.calendar_today, color: Colors.white,)
              ),
              style: CSS().teksPutih(),
              onTap: (){
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    onChanged: (date) {
                      signupBloc.pasangTanggal(date);
                    },
                    onConfirm: (date) {
                      signupBloc.pasangTanggal(date);
                    },
                    currentTime: DateTime.now(), locale: LocaleType.en);
              },
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20),
            ),

            SizedBox(
              width: 200,
              child: RaisedButton(
                child: Text(Str.signUp),
                color: Colors.deepOrange,
                textColor: Colors.white,
                shape: CSS().tombolRounded(warna: Colors.white, tebal: 18),
                onPressed: (){
                  if (_formKey.currentState.validate()){
                    signupBloc..add(signupBloc.makeRequest());
                  }

                },
              ),
            ),


            
            BlocBuilder<SignupBloc, SignUpResponse>(
              builder: (context, response) {
              if (response is Unknown){
                return Container();
              }else if(response is IsLoading){
                return Container(child: CircularProgressIndicator(backgroundColor: Colors.white,));
              }else if(response is SignUpResponse){
                return Container(
                  child: Text(
                    Str.resultSignUp, textAlign: TextAlign.center, style: CSS().teksPutih(),
                  ),
                );
              }else{
                return Container();
              }
            }
          )



          ],

        ),
      ),
    )
    )
    ;
  }


}