class ForgotPasswordModel {
  bool success;
  String jumlah;
  String message;
  String find1;
  String find2;
  String find3;
  String find4;
  String find5;
  String find6;

  ForgotPasswordModel(
      {this.success,
        this.jumlah,
        this.message,
        this.find1,
        this.find2,
        this.find3,
        this.find4,
        this.find5,
        this.find6});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    jumlah = json['jumlah'];
    message = json['message'];
    find1 = json['find1'];
    find2 = json['find2'];
    find3 = json['find3'];
    find4 = json['find4'];
    find5 = json['find5'];
    find6 = json['find6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['jumlah'] = this.jumlah;
    data['message'] = this.message;
    data['find1'] = this.find1;
    data['find2'] = this.find2;
    data['find3'] = this.find3;
    data['find4'] = this.find4;
    data['find5'] = this.find5;
    data['find6'] = this.find6;
    return data;
  }
}

class Unknown extends ForgotPasswordModel{}
class IsLoading extends ForgotPasswordModel{}