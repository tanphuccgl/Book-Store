import 'package:book_store/feature/cart/data/models/carted_data.dart';
import 'package:book_store/feature/product/data/models/product_data.dart';

class CartResponseModel {
  int status;
  bool success;
  String email;
  String tongMathang;
  String tongSanpham;
  String tongMathangthanhtoan;
  String tongSanphamthanhtoan;
  String tongTienthanhtoan;
  List<ProductData> cart;
  List<ProductedData> carted;
  String message;

  CartResponseModel(
      {this.status,
        this.success,
        this.email,
        this.tongMathang,
        this.tongSanpham,
        this.tongMathangthanhtoan,
        this.tongSanphamthanhtoan,
        this.tongTienthanhtoan,
        this.cart,
        this.carted,
        this.message});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    email = json['email'];
    tongMathang = json['tongMathang'];
    tongSanpham = json['tongSanpham'];
    tongMathangthanhtoan = json['tongMathangthanhtoan'];
    tongSanphamthanhtoan = json['tongSanphamthanhtoan'];
    tongTienthanhtoan = json['tongTienthanhtoan'];
    if (json['cart'] != null) {
      cart = new List<ProductData>();
      json['cart'].forEach((v) {
        cart.add(new ProductData.fromJson(v));
      });
    }
    if (json['carted'] != null) {
      carted = new List<ProductedData>();
      json['carted'].forEach((v) {
        carted.add(new ProductedData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['email'] = this.email;
    data['tongMathang'] = this.tongMathang;
    data['tongSanpham'] = this.tongSanpham;
    data['tongMathangthanhtoan'] = this.tongMathangthanhtoan;
    data['tongSanphamthanhtoan'] = this.tongSanphamthanhtoan;
    data['tongTienthanhtoan'] = this.tongTienthanhtoan;
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
    }
    if (this.carted != null) {
      data['carted'] = this.carted.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}



