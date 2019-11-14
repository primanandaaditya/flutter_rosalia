import 'package:flutter/material.dart';
import 'helpers/str.dart';
import 'views/LoginScreen.dart';
import 'views/ForgotPasswordScreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: Str.namaPerusahaan,
      home: ForgotPassword()
    )
  );
}

