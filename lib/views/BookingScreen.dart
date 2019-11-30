import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/helpers/validator.dart';
import 'package:flutter_rosa/service/BookingService.dart';



class BookingUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CSS().appbarHitam(Str.booking, Icons.bookmark),
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
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                controller: BookingService.tcTanggal,
                style: CSS().teksPutih(),

                decoration: InputDecoration(
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.labelTanggalBerangkat,
                  icon: Icon(Icons.calendar_today, color: Colors.white)

                ),
              ),



              TextFormField(
                onTap: (){
                  BookingService.tampilkanAgenNaik(context);
                },
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                controller: BookingService.tcNaik,
                style: CSS().teksPutih(),

                decoration: InputDecoration(
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.labelNaik,
                  icon: Icon(Icons.subdirectory_arrow_left, color: Colors.white)

                ),
              ),


              TextFormField(
                onTap: (){
                  BookingService.tampilkanAgenTurun(context);
                },
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                controller: BookingService.tcTurun,
                style: CSS().teksPutih(),

                decoration: InputDecoration(
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.labelTurun,
                  icon: Icon(Icons.subdirectory_arrow_right, color: Colors.white)

                ),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                controller: BookingService.tcJumlahPenumpang,
                style: CSS().teksPutih(),

                decoration: InputDecoration(
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.jumlahPenumpang,
                  icon: Icon(Icons.person_add, color: Colors.white)

                ),
              ),


              TextFormField(
                onTap: (){
                  BookingService.tampilkanAgen(context);
                },
                validator: (value){
                  return Validator.validateEmpty(value);
                },
                controller: BookingService.tcKelas,
                style: CSS().teksPutih(),

                decoration: InputDecoration(
                  enabledBorder: CSS().garisBawahPutih(),
                  focusedBorder: CSS().garisBawahPutih(),
                  labelStyle: CSS().teksPutih(),
                  labelText: Str.jenisArmada,
                  icon: Icon(Icons.directions_bus, color: Colors.white)

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


