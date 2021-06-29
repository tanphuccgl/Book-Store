import 'dart:convert';
import 'dart:developer';


import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:http/http.dart' as http;

abstract class Product7RemoteDataSource {
  Future<ProductResponseModel> getProduct7();

}

class Product7RemoteDataSourceImpl implements Product7RemoteDataSource {
  final http.Client client;

  Product7RemoteDataSourceImpl({this.client});

  @override
  Future<ProductResponseModel> getProduct7() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl();
  }


  Future<ProductResponseModel> _getFromUrl() async {
    final response =
        await client.get('$mainUrl/product/loai7', headers: {
      "Accept": "application/json",
      "content-type": "application/json",

      // k co header la failed 415
    });
    log("Post Get Product7:" + "$mainUrl/product/loai7");
    log("Response Json GetProduct7: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = ProductResponseModel.fromJson(json.decode(response.body));
      return result;
    } else {

      throw ServerException();
    }

  }



}
