import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProduct {
  ApiProduct._();

  static Future<ProductResponseModel> getData() async {
    try {
      final response = await Dio().get('$mainUrl/product',options: new Options(headers:
      {
        'auth-token': '${getCurrentUser().token}',
      }));

      //   print("aaa ${response.data}");
      return ProductResponseModel.fromJson(response.data);

      //return (reponse.data as List).map((e) => Country.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e);
    }
  }



}