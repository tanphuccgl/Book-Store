import 'package:book_store/feature/sign_up/data/models/register_data.dart';

class RegisterResponseModel {
  String message;
  RegisterData data;
  int status;
  bool success;

  RegisterResponseModel({this.message, this.data, this.status, this.success});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new RegisterData.fromJson(json['data']) : null;
    status = json['status'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    data['success'] = this.success;
    return data;
  }
}

