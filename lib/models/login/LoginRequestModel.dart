
class LoginRequestModel {
  String memberId;
  String password;

  LoginRequestModel({this.memberId, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member_id'] = this.memberId;
    data['password'] = this.password;
    return data;
  }
}