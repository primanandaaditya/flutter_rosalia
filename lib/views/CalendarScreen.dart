import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/util.dart';
import 'package:flutter_rosa/models/calendar/CalendarIntent.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

CalendarController calendarController=CalendarController();
String teks;


class CalendarUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: View(),
    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            decoration: BoxDecoration(

            ),
           width: double.infinity,
           height: double.infinity,


           child: TableCalendar(
             onDaySelected: (tanggal,coba){
               debugPrint(tanggal.weekday.toString());

               teks=  Util.tanggalIndonesia(tanggal);
               CalendarIntent calendarIntent = CalendarIntent(text: teks, value: tanggal);
               Navigator.pop(context, calendarIntent);
             },
             calendarController: calendarController,
             calendarStyle: CalendarStyle(
               todayColor: Colors.orange,
               selectedColor: Colors.green
             ),
       ),
      ),
    );
  }
}