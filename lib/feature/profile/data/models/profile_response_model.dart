

import 'package:book_store/feature/profile/data/models/profile_data.dart';

class ProfileResponseModel {
  int status;
  bool success;
  ProfileData data;
  String message;

  ProfileResponseModel({this.status, this.success, this.data, this.message});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

