import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/models/calendar/CalendarIntent.dart';
import 'package:flutter_rosa/views/CalendarScreen.dart';
import 'dart:convert';
import 'package:flutter_rosa/service/BookingService.dart';



class BookingUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: View()
      ),
    );
  }
}

class View extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: CSS().gradienLinear()
      ),

      child: Form(
        key: BookingService.kunci,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              TextFormField(
                onTap: (){
                  BookingService.tampilkanKalender(context);
                },
                controller: BookingService.tcTanggal,
                style: CSS().teksPutih(),

                decoration: InputDecoration(
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.labelTanggalBerangkat

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


