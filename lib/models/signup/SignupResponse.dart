class SignUpResponse {
  int success1;
  String success2;
  String success3;
  String success4;
  String success5;
  String success6;

  SignUpResponse(
      {this.success1,
      this.success2,
      this.success3,
      this.success4,
      this.success5,
      this.success6});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    success1 = json['success1'];
    success2 = json['success2'];
    success3 = json['success3'];
    success4 = json['success4'];
    success5 = json['success5'];
    success6 = json['success6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success1'] = this.success1;
    data['success2'] = this.success2;
    data['success3'] = this.success3;
    data['success4'] = this.success4;
    data['success5'] = this.success5;
    data['success6'] = this.success6;
    return data;
  }
}

class Unknown extends SignUpResponse{}
class IsLoading extends SignUpResponse{}
class ResponseError extends SignUpResponse{}