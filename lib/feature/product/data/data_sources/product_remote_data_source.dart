import 'dart:convert';
import 'dart:developer';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<ProductResponseModel> getProduct();

}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({this.client});

  @override
  Future<ProductResponseModel> getProduct() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl();
  }


  Future<ProductResponseModel> _getFromUrl() async {
    final response =
        await client.get('$mainUrl/product', headers: {
      "Accept": "application/json",
      "content-type": "application/json",

      // k co header la failed 415
    });
    log("Post Get Product:" + "$mainUrl/product");
    log("Response Json GetProduct: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = ProductResponseModel.fromJson(json.decode(response.body));
      return result;
    } else {

      throw ServerException();
    }

  }



}
