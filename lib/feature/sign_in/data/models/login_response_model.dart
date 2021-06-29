import 'package:book_store/feature/sign_in/data/models/login_data.dart';

class LoginResponseModel {
  String message;
  LoginData data;
  bool success;
  int status;

  LoginResponseModel({this.message, this.data, this.success, this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

