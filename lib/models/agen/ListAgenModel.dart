class ListAgenModel {
  List<AgenResponseModel> agenResponseModel;

  ListAgenModel({this.agenResponseModel});

  ListAgenModel.fromJson(Map<String, dynamic> json) {
    if (json['AgenResponseModel'] != null) {
      agenResponseModel = new List<AgenResponseModel>();
      json['AgenResponseModel'].forEach((v) {
        agenResponseModel.add(new AgenResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agenResponseModel != null) {
      data['AgenResponseModel'] =
          this.agenResponseModel.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgenResponseModel {
  String agenId;
  String namaAgen;
  String singkatan;
  String namaKota;

  AgenResponseModel(
      {this.agenId, this.namaAgen, this.singkatan, this.namaKota});

  AgenResponseModel.fromJson(Map<String, dynamic> json) {
    agenId = json['agen_id'];
    namaAgen = json['nama_agen'];
    singkatan = json['singkatan'];
    namaKota = json['nama_kota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agen_id'] = this.agenId;
    data['nama_agen'] = this.namaAgen;
    data['singkatan'] = this.singkatan;
    data['nama_kota'] = this.namaKota;
    return data;
  }
}