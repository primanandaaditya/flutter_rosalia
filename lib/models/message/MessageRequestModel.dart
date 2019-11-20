class MessageRequestModel {
  String email;
  String message;

  MessageRequestModel({this.email, this.message});

  MessageRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['message'] = this.message;
    return data;
  }
}