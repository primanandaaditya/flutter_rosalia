class ListBusModel {
  List<BusResponseModel> busResponseModel;

  ListBusModel({this.busResponseModel});

  ListBusModel.fromJson(Map<String, dynamic> json) {
    if (json['BusResponseModel'] != null) {
      busResponseModel = new List<BusResponseModel>();
      json['BusResponseModel'].forEach((v) {
        busResponseModel.add(new BusResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.busResponseModel != null) {
      data['BusResponseModel'] =
          this.busResponseModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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

