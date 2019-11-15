class SignUpRequest {
  String signName;
  String signLahir;
  String signHp;
  String signEmail;

  SignUpRequest({this.signName, this.signLahir, this.signHp, this.signEmail});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    signName = json['sign_name'];
    signLahir = json['sign_lahir'];
    signHp = json['sign_hp'];
    signEmail = json['sign_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sign_name'] = this.signName;
    data['sign_lahir'] = this.signLahir;
    data['sign_hp'] = this.signHp;
    data['sign_email'] = this.signEmail;
    return data;
  }
}