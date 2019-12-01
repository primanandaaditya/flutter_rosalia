import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'helpers/str.dart';
import 'views/BookingScreen.dart';


void main() {
  runApp(
    MaterialApp(

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('id'), // Indonesia
        ],

      title: Str.namaPerusahaan,
      home: BookingUtama()
    )
  );
}

