import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/blocs/MessageBloc.dart';
import 'package:flutter_rosa/helpers/validator.dart';
import 'package:flutter_rosa/models/message/MessageRequestModel.dart';
import 'package:flutter_rosa/models/message/MessageResponseModel.dart';

final _formKey=GlobalKey<FormState>();

class MessageUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocProvider(builder: (context) => MessageBloc(),
        child: View(),
      ),
    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    MessageBloc messageBloc=BlocProvider.of<MessageBloc>(context);
    return  Form(
      key: _formKey,
      
      
        child: Container(
      
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: CSS().gradienLinear()
          ),


              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Icon(Icons.warning, color:Colors.white, size:100),
                Text(Str.message, textAlign: TextAlign.center, style: CSS().teksPutih(),),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),

                TextFormField(
                  validator: (value){
                    return Validator.validateEmail(value);
                  },
                  autofocus: true,
                  style: CSS().teksPutih(),
                  controller: messageBloc.tcEmail,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email, color:Colors.white),
                    enabledBorder: CSS().garisBawahPutih(),
                    focusedBorder: CSS().garisBawahPutih(),
                    labelText: Str.email,
                    labelStyle: CSS().teksPutih()
                  ),
                ),

                TextFormField(
                  validator: (value){
                    return Validator.validateEmpty(value);
                  },
                  style: CSS().teksPutih(),
                  controller: messageBloc.tcMessage,
                  decoration: InputDecoration(
                    icon: Icon(Icons.add_to_queue, color:Colors.white),
                    enabledBorder: CSS().garisBawahPutih(),
                    focusedBorder: CSS().garisBawahPutih(),
                    labelText: Str.pesan,
                    labelStyle: CSS().teksPutih(),
                    
                  ),
                ),

                Padding(
                  padding:EdgeInsets.only(bottom: 10),
                ),

                RaisedButton(
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  elevation: 6,
                  shape: CSS().tombolRounded(warna: Colors.white, tebal: 18),
                  child: Text(Str.message) ,
                  onPressed: (){
                    if (_formKey.currentState.validate()){
                    messageBloc.add(messageBloc.createRequest());
                    }
                  },
                ),

                BlocBuilder<MessageBloc, MessageResponseModel>(
                  builder: (context, response){
                    if (response is MessageUninitialized){
                      return Container();
                    }else if(response is MessageLoading){
                      return CircularProgressIndicator();
                    }else if(response is MessageResponseModel){
                      return Text("Pesan telah terkirim. Terima kasih", style: CSS().teksPutih(),);

                    }
                  }
                )


              ],
            
          ),
        ),
      
    );
  }
}