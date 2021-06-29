import 'package:book_store/feature/product/data/models/product_data.dart';

class ProductResponseModel {
  String message;
  bool success;
  int status;
  List<ProductData> data;

  ProductResponseModel({this.message, this.success, this.status, this.data});

  ProductResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    status = json['status'];
    if (json['data'] != null) {
      data = new List<ProductData>();
      json['data'].forEach((v) {
        data.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


