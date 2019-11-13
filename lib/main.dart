import 'package:flutter/material.dart';
import 'helpers/str.dart';
import 'views/LoginScreen.dart';
import 'presenter/LoginPresenter.dart';

void main() {
  runApp(
    MaterialApp(
      title: Str.namaPerusahaan,
      home: Utama( new BasicLoginPresenter()),
    )
  );
}

