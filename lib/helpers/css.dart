import 'package:flutter/material.dart';

class CSS {

   Container garisLangkah(){
     return 
     Container(
              width: 30,
              height: 2,
              color: Colors.white,
            );
   }

   Container bulatanLangkah(int langkahKe, int activeIndex){
     return 
      Container(
              child: Center(
                child: Text(langkahKe.toString(), style: teksPutih(),),
              ),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
                color: (activeIndex==langkahKe)? Colors.green[600]: Colors.black
              ),
            );
   }

   Row getLangkah(int activeIndex){
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            //lingkaran pertama
            //====================================
            //====================================
            bulatanLangkah(1, activeIndex),

            //garis pertama
            //====================================
            //====================================
            garisLangkah(),

            //lingkaran kedua
            //====================================
            //====================================
            bulatanLangkah(2, activeIndex),


            //garis kedua
            //====================================
            //====================================
            garisLangkah(),


            //lingkaran ketiga
            //====================================
            //====================================
            bulatanLangkah(3, activeIndex),


             //garis ketiga
            //====================================
            //====================================
            garisLangkah(),


            //lingkaran keempat
            //====================================
            //====================================
            bulatanLangkah(4, activeIndex),



          ],

        );
  }

  AppBar appbarHitam(String judul, IconData icons){
    return AppBar(
        elevation: 3,
        leading: Icon(icons, color: Colors.white,),
        title: Text(judul, style: CSS().teksPutih(),),
        backgroundColor: Colors.black
      );
  }

  LinearGradient gradienLinear(){
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black,Colors.lightBlue[900]]
    );
  }

  LinearGradient gradienBiru(){
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.blueAccent[400],Colors.blueAccent[700]]
    );
  }

  TextStyle teksPutih(){
    return TextStyle(
      color: Colors.white,
      fontFamily: 'Muli'
    );
  }

  TextStyle teksAbu(){
    return TextStyle(
      color: Colors.grey,
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
