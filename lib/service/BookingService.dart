import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/css.dart';
import 'package:flutter_rosa/helpers/str.dart';
import 'package:flutter_rosa/models/agen/ListAgenModel.dart';
import 'package:flutter_rosa/models/bus/BusResponseModel.dart';
import 'package:flutter_rosa/models/calendar/CalendarIntent.dart';
import 'package:flutter_rosa/views/BusScreen.dart';
import 'package:flutter_rosa/views/CalendarScreen.dart';
import 'package:flutter_rosa/views/AgenScreen.dart';

class BookingService{


  static final kunci=GlobalKey<FormState>();

  static TextEditingController tcTanggal = TextEditingController();
  static TextEditingController tcNaik = TextEditingController();
  static TextEditingController tcTurun = TextEditingController();
  static TextEditingController tcJumlahPenumpang = TextEditingController();
  static TextEditingController tcKelas = TextEditingController();

  static DateTime pergi=DateTime.now();
  static String idNaik="";
  static String idTurun="";
  static String idKelas="";


  static balikAsaldanTujuan(){

    String idBalik = idNaik;
    String tcBalik = tcNaik.text;

    idNaik = idTurun;
    tcNaik.text = tcTurun.text;

    idTurun = idBalik;
    tcTurun.text=tcBalik;
    
  }

  static List<Step> step(){
    List<Step> hasil=List<Step>();
    hasil.add(Step(isActive: true, title: Text("", style: CSS().teksPutih(),), content: Text("data"), subtitle: Text("")));
    hasil.add(Step(title: Text("", style: CSS().teksPutih(),), content: Text("data"), subtitle: Text("")));
    hasil.add(Step(title: Text("", style: CSS().teksPutih(),), content: Text("data"), subtitle: Text("")));
    hasil.add(Step(title: Text("", style: CSS().teksPutih(),), content: Text("data"), subtitle: Text("")));

    return hasil;
  }

  static void tampilkanKalender(BuildContext context) async {
    final CalendarIntent calendarIntent = await Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarUtama()),);
    tcTanggal.text=calendarIntent.text;
    pergi = calendarIntent.value;
  }

  static void tampilkanAgenNaik(BuildContext context) async {
    final AgenResponseModel agenResponseModel = await Navigator.push(context, MaterialPageRoute(builder: (context) => AgenUtama()),);
    tcNaik.text=agenResponseModel.namaAgen;
    idNaik=agenResponseModel.agenId;
  }

  static void tampilkanAgenTurun(BuildContext context) async {
    final AgenResponseModel agenResponseModel = await Navigator.push(context, MaterialPageRoute(builder: (context) => AgenUtama()),);
    tcTurun.text=agenResponseModel.namaAgen;
    idTurun=agenResponseModel.agenId;
  }

  static void tampilkanAgen(BuildContext context) async {
    final BusResponseModel busResponseModel = await Navigator.push(context, MaterialPageRoute(builder: (context) => BusUtama()),);
    tcKelas.text=busResponseModel.namaKelas;
    idKelas=busResponseModel.kelasId;
  }



}