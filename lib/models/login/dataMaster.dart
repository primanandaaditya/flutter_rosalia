import 'package:flutter_rosa/models/login/dataChild.dart' as dataChild;

class Data  {
  
  dataChild.Data data;
  String messages;
  bool success;

  Data({this.data, this.messages, this.success});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new dataChild.Data.fromJson(json['data']) : null;
    messages = json['messages'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['messages'] = this.messages;
    data['success'] = this.success;
    return data;
  }
}
