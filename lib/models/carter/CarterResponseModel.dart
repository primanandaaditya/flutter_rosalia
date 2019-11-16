class CarterResponseModel {
  bool success;

  CarterResponseModel({this.success});

  CarterResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class CarterUninitialized extends CarterResponseModel{}
class CarterIsLoading extends CarterResponseModel{}
class CarterError extends CarterResponseModel{}