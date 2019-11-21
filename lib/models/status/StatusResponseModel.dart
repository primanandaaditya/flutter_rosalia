class StatusResponseModel {
  Null data;
  bool status;
  String q;

  StatusResponseModel({this.data, this.status, this.q});

  StatusResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    q = json['q'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['status'] = this.status;
    data['q'] = this.q;
    return data;
  }
}

class StatusUninitialized extends StatusResponseModel{}
class StatusLoading extends StatusResponseModel{}
class StatusError extends StatusResponseModel{}
class StatusSuccess extends StatusResponseModel{}