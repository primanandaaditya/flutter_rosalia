import 'package:flutter/material.dart';

class LoginViewModel{
  TextEditingController tecMemberID=TextEditingController();
  TextEditingController tecPassword=TextEditingController();
  bool isLoading = false;
  bool isLoginGagal=false;

  void selesaiLoginTapiSalah(){
    isLoading=false;
    isLoginGagal=true;
  }

  void selesaiLoginBenar(){
    isLoading=false;
    isLoginGagal=false;
  }
}