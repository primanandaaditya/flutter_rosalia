import 'package:flutter/material.dart';

class CSS {

  LinearGradient gradienLinear(){
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black,Colors.lightBlue[900]]
    );
  }

  TextStyle teksPutih(){
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Muli'
    );
  }

}
