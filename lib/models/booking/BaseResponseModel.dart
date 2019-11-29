class BaseResponseModel {
  int recordsTotal;
  List<Data> data;
  String status;

  BaseResponseModel({this.recordsTotal, this.data, this.status});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    recordsTotal = json['recordsTotal'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recordsTotal'] = this.recordsTotal;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String harga;
  String keberangkatanId;
  Null kodeKeberangkatan;
  String agenId;
  Null wilayahAgenId;
  String wilayahId;
  String tanggalKeberangkatan;
  String waktuKeberangkatan;
  Null aktualWaktuKeberangkatan;
  String statusKeberangkatanId;
  Null ketKeberangkatan;
  String ruteId;
  String kodeRute;
  String jalurId;
  String namaJalur;
  String kelasId;
  Null armadaId;
  Null nolambung;
  Null nopol;
  String jumlahKursi;
  String statusArmadaId;
  Null ketArmada;
  Null estimasiSelesai;
  String flagHidden;
  String tglInput;
  String namaKelas;
  String agenDilewati;
  String agenTransitId;
  Null agenTransit;
  Null singkatanTransit;
  String agenSiapId;
  Null agenSiap;
  Null singkatanSiap;
  String keterangan;

  Data(
      {this.harga,
        this.keberangkatanId,
        this.kodeKeberangkatan,
        this.agenId,
        this.wilayahAgenId,
        this.wilayahId,
        this.tanggalKeberangkatan,
        this.waktuKeberangkatan,
        this.aktualWaktuKeberangkatan,
        this.statusKeberangkatanId,
        this.ketKeberangkatan,
        this.ruteId,
        this.kodeRute,
        this.jalurId,
        this.namaJalur,
        this.kelasId,
        this.armadaId,
        this.nolambung,
        this.nopol,
        this.jumlahKursi,
        this.statusArmadaId,
        this.ketArmada,
        this.estimasiSelesai,
        this.flagHidden,
        this.tglInput,
        this.namaKelas,
        this.agenDilewati,
        this.agenTransitId,
        this.agenTransit,
        this.singkatanTransit,
        this.agenSiapId,
        this.agenSiap,
        this.singkatanSiap,
        this.keterangan});

  Data.fromJson(Map<String, dynamic> json) {
    harga = json['Harga'];
    keberangkatanId = json['keberangkatan_id'];
    kodeKeberangkatan = json['kode_keberangkatan'];
    agenId = json['agen_id'];
    wilayahAgenId = json['wilayah_agen_id'];
    wilayahId = json['wilayah_id'];
    tanggalKeberangkatan = json['tanggal_keberangkatan'];
    waktuKeberangkatan = json['waktu_keberangkatan'];
    aktualWaktuKeberangkatan = json['aktual_waktu_keberangkatan'];
    statusKeberangkatanId = json['status_keberangkatan_id'];
    ketKeberangkatan = json['ket_keberangkatan'];
    ruteId = json['rute_id'];
    kodeRute = json['kode_rute'];
    jalurId = json['jalur_id'];
    namaJalur = json['nama_jalur'];
    kelasId = json['kelas_id'];
    armadaId = json['armada_id'];
    nolambung = json['nolambung'];
    nopol = json['nopol'];
    jumlahKursi = json['jumlah_kursi'];
    statusArmadaId = json['status_armada_id'];
    ketArmada = json['ket_armada'];
    estimasiSelesai = json['estimasi_selesai'];
    flagHidden = json['flag_hidden'];
    tglInput = json['tgl_input'];
    namaKelas = json['nama_kelas'];
    agenDilewati = json['agen_dilewati'];
    agenTransitId = json['agen_transit_id'];
    agenTransit = json['agen_transit'];
    singkatanTransit = json['singkatan_transit'];
    agenSiapId = json['agen_siap_id'];
    agenSiap = json['agen_siap'];
    singkatanSiap = json['singkatan_siap'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Harga'] = this.harga;
    data['keberangkatan_id'] = this.keberangkatanId;
    data['kode_keberangkatan'] = this.kodeKeberangkatan;
    data['agen_id'] = this.agenId;
    data['wilayah_agen_id'] = this.wilayahAgenId;
    data['wilayah_id'] = this.wilayahId;
    data['tanggal_keberangkatan'] = this.tanggalKeberangkatan;
    data['waktu_keberangkatan'] = this.waktuKeberangkatan;
    data['aktual_waktu_keberangkatan'] = this.aktualWaktuKeberangkatan;
    data['status_keberangkatan_id'] = this.statusKeberangkatanId;
    data['ket_keberangkatan'] = this.ketKeberangkatan;
    data['rute_id'] = this.ruteId;
    data['kode_rute'] = this.kodeRute;
    data['jalur_id'] = this.jalurId;
    data['nama_jalur'] = this.namaJalur;
    data['kelas_id'] = this.kelasId;
    data['armada_id'] = this.armadaId;
    data['nolambung'] = this.nolambung;
    data['nopol'] = this.nopol;
    data['jumlah_kursi'] = this.jumlahKursi;
    data['status_armada_id'] = this.statusArmadaId;
    data['ket_armada'] = this.ketArmada;
    data['estimasi_selesai'] = this.estimasiSelesai;
    data['flag_hidden'] = this.flagHidden;
    data['tgl_input'] = this.tglInput;
    data['nama_kelas'] = this.namaKelas;
    data['agen_dilewati'] = this.agenDilewati;
    data['agen_transit_id'] = this.agenTransitId;
    data['agen_transit'] = this.agenTransit;
    data['singkatan_transit'] = this.singkatanTransit;
    data['agen_siap_id'] = this.agenSiapId;
    data['agen_siap'] = this.agenSiap;
    data['singkatan_siap'] = this.singkatanSiap;
    data['keterangan'] = this.keterangan;
    return data;
  }
}

class BaseResponseBegin extends BaseResponseModel{}
class BaseResponseLoading extends BaseResponseModel{}
class BaseResponseError extends BaseResponseModel{}
class BaseResponseAda extends BaseResponseModel{}
class BaseResponseKosong extends BaseResponseModel{}