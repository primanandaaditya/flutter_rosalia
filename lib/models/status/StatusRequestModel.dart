class StatusRequestModel {
  String nobooking;
  String nohp;

  StatusRequestModel({this.nobooking, this.nohp});

  StatusRequestModel.fromJson(Map<String, dynamic> json) {
    nobooking = json['nobooking'];
    nohp = json['nohp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nobooking'] = this.nobooking;
    data['nohp'] = this.nohp;
    return data;
  }
}