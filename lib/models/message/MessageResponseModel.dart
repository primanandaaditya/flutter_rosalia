class MessageResponseModel {
  bool success;

  MessageResponseModel({this.success});

  MessageResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class MessageUninitialized extends MessageResponseModel{}
class MessageLoading extends MessageResponseModel{}
class MessageError extends MessageResponseModel{}