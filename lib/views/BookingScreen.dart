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

              CSS().getLangkah(1),

              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),

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
                  labelStyle: CSS().teksAbu(),
                  labelText: Str.labelTanggalBerangkat,
                  icon: Icon(Icons.calendar_today, color: Colors.grey)

                ),
              ),


              Row(
                mainAxisSize: MainAxisSize.max,
                
                children: <Widget>[

                  Expanded(
                    flex: 4,
                    child: Column(
                      children: <Widget>[

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
                            labelStyle: CSS().teksAbu(),
                            labelText: Str.labelNaik,
                            icon: Icon(Icons.subdirectory_arrow_left, color: Colors.grey)

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
                            labelStyle: CSS().teksAbu(),
                            labelText: Str.labelTurun,
                            icon: Icon(Icons.subdirectory_arrow_right, color: Colors.grey)

                          ),
                        ),
                        
                      ],
                    ),
                  ),

                  Expanded (
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[

                        Padding(
                          padding: EdgeInsets.only(bottom: 60),

                        ),

                        FloatingActionButton(
                          mini: true,
                          child: Icon(Icons.arrow_drop_up),
                          onPressed: (){
                            BookingService.balikAsaldanTujuan();
                          },
                        )
                      ],
                    )
                  )
                ],
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
                  labelStyle: CSS().teksAbu(),
                  labelText: Str.jumlahPenumpang,
                  icon: Icon(Icons.person_add, color: Colors.grey)

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
                  labelStyle: CSS().teksAbu(),
                  labelText: Str.jenisArmada,
                  icon: Icon(Icons.directions_bus, color: Colors.grey)

                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),


              RaisedButton(
                onPressed: (){},
                elevation: 6,
                child: Text(Str.filterKelas, style: CSS().teksPutih(),),
                textColor: Colors.white,
                shape: CSS().tombolRounded(warna: Colors.white,tebal: 18),
                color: Colors.deepOrange,
                
              )

            ],
          ),
        ),
      ),
    );
  }
}


