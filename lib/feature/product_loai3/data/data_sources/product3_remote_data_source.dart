import 'dart:convert';
import 'dart:developer';


import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:http/http.dart' as http;

abstract class Product3RemoteDataSource {
  Future<ProductResponseModel> getProduct3();

}

class Product3RemoteDataSourceImpl implements Product3RemoteDataSource {
  final http.Client client;

  Product3RemoteDataSourceImpl({this.client});

  @override
  Future<ProductResponseModel> getProduct3() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl();
  }


  Future<ProductResponseModel> _getFromUrl() async {
    final response =
        await client.get('$mainUrl/product/loai3', headers: {
      "Accept": "application/json",
      "content-type": "application/json",

      // k co header la failed 415
    });
    log("Post Get Product3:" + "$mainUrl/product/loai3");
    log("Response Json GetProduct3: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = ProductResponseModel.fromJson(json.decode(response.body));
      return result;
    } else {

      throw ServerException();
    }

  }



}
