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

  TextStyle teksPutihKecil(){
    return TextStyle(
        color: Colors.white30,
        fontFamily: 'Muli',
      fontSize: 10
    );
  }

  TextStyle judulPutih(){
    return TextStyle(
        color: Colors.white,
        fontFamily: 'Muli',
      fontWeight: FontWeight.bold,
        fontSize: 20
    );
  }

  TextStyle teksMerah(){
    return TextStyle(
        color: Colors.red,
        fontFamily: 'Muli'
    );
  }

  UnderlineInputBorder garisBawahPutih(){
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
  }

  RoundedRectangleBorder tombolRounded({Color warna, double tebal}){
    return RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(tebal),
        side: BorderSide(color: warna)
    );

  }

}
