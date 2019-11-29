import 'package:flutter_rosa/helpers/str.dart';

class Util{

  static String tanggalIndonesia(DateTime tanggal){
    String hasil = "";
    String hari = Str.namaHari[tanggal.weekday];
    String tgl=tanggal.day.toString();
    String bulan = Str.namaBulan[tanggal.month];
    String tahun = tanggal.year.toString();

    hasil = hari + ", " + tgl + " " + bulan + " " + tahun;
    return hasil;
  }

}