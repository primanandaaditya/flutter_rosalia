class ForgotPasswordRequest {
  String forgotId;
  String forgotMail;

  ForgotPasswordRequest({this.forgotId, this.forgotMail});

  ForgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    forgotId = json['forgot_id'];
    forgotMail = json['forgot_mail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['forgot_id'] = this.forgotId;
    data['forgot_mail'] = this.forgotMail;
    return data;
  }
}