class BusResponseModel {
  String kelasId;
  String namaKelas;
  String flagAktif;
  String maxKursi;
  String minKursi;
  String minMax;
  String bagasiKg;
  String hidden;

  BusResponseModel(
      {this.kelasId,
        this.namaKelas,
        this.flagAktif,
        this.maxKursi,
        this.minKursi,
        this.minMax,
        this.bagasiKg,
        this.hidden});

  BusResponseModel.fromJson(Map<String, dynamic> json) {
    kelasId = json['kelas_id'];
    namaKelas = json['nama_kelas'];
    flagAktif = json['flag_aktif'];
    maxKursi = json['max_kursi'];
    minKursi = json['min_kursi'];
    minMax = json['min_max'];
    bagasiKg = json['bagasi_kg'];
    hidden = json['hidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kelas_id'] = this.kelasId;
    data['nama_kelas'] = this.namaKelas;
    data['flag_aktif'] = this.flagAktif;
    data['max_kursi'] = this.maxKursi;
    data['min_kursi'] = this.minKursi;
    data['min_max'] = this.minMax;
    data['bagasi_kg'] = this.bagasiKg;
    data['hidden'] = this.hidden;
    return data;
  }
}

class BusBegin extends BusResponseModel{}
class BusLoading extends BusResponseModel{}
class BusError extends BusResponseModel{}