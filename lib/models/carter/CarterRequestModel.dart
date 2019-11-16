class CarterRequestModel {
  String nama;
  String telp;
  String tipe;
  String comment;

  CarterRequestModel({this.nama, this.telp, this.tipe, this.comment});

  CarterRequestModel.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    telp = json['telp'];
    tipe = json['tipe'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['telp'] = this.telp;
    data['tipe'] = this.tipe;
    data['comment'] = this.comment;
    return data;
  }
}