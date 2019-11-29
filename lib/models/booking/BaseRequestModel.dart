class BaseRequestModel {
  String jml;
  String trn;
  String nk;
  String pr;
  String kls;

  BaseRequestModel({this.jml, this.trn, this.nk, this.pr, this.kls});

  BaseRequestModel.fromJson(Map<String, dynamic> json) {
    jml = json['jml'];
    trn = json['trn'];
    nk = json['nk'];
    pr = json['pr'];
    kls = json['kls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jml'] = this.jml;
    data['trn'] = this.trn;
    data['nk'] = this.nk;
    data['pr'] = this.pr;
    data['kls'] = this.kls;
    return data;
  }
}