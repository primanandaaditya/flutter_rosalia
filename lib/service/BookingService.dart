import 'package:flutter/material.dart';
import 'package:flutter_rosa/models/calendar/CalendarIntent.dart';
import 'package:flutter_rosa/views/CalendarScreen.dart';

class BookingService{


  static final kunci=GlobalKey<FormState>();
  static TextEditingController tcTanggal = TextEditingController();
  static DateTime pergi=DateTime.now();

  static void tampilkanKalender(BuildContext context) async {
    final CalendarIntent calendarIntent = await Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarUtama()),);
    tcTanggal.text=calendarIntent.text;
    pergi = calendarIntent.value;
  }



}