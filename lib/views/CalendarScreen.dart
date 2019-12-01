import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/util.dart';
import 'package:flutter_rosa/models/calendar/CalendarIntent.dart';
import 'package:table_calendar/table_calendar.dart';


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
          appBar: CSS().appbarHitam(Str.pilihTanggal, Icons.calendar_today),
          body: Container(
            decoration: BoxDecoration(
              gradient: CSS().gradienLinear()
            ),
           width: double.infinity,
           height: double.infinity,

           child: TableCalendar(
             locale: 'id_ID',
             startDay: DateTime.now(),
             builders: CalendarBuilders(
               
             ),
             
             onDaySelected: (tanggal,coba){
               teks=  Util.tanggalIndonesia(tanggal);
               CalendarIntent calendarIntent = CalendarIntent(text: teks, value: tanggal);
               Navigator.pop(context, calendarIntent);
             },
             calendarController: calendarController,

             daysOfWeekStyle: DaysOfWeekStyle(
               weekdayStyle: CSS().teksPutih(),
               weekendStyle: CSS().teksMerah()
             ),

             

             headerStyle: HeaderStyle(
               leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white,),
               rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white,),
               centerHeaderTitle: true,
               formatButtonVisible: false,
               titleTextStyle: CSS().teksPutih()
             ),

             calendarStyle: CalendarStyle(
               weekdayStyle: CSS().teksPutih(),
               weekendStyle: CSS().teksMerah(),
               todayColor: Colors.orange,
               selectedColor: Colors.deepOrange
             ),
          ),
      ),
    );
  }
}