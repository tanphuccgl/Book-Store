import 'dart:convert';
import 'dart:developer';


import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:http/http.dart' as http;

abstract class Product4RemoteDataSource {
  Future<ProductResponseModel> getProduct4();

}

class Product4RemoteDataSourceImpl implements Product4RemoteDataSource {
  final http.Client client;

  Product4RemoteDataSourceImpl({this.client});

  @override
  Future<ProductResponseModel> getProduct4() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl();
  }


  Future<ProductResponseModel> _getFromUrl() async {
    final response =
        await client.get('$mainUrl/product/loai4', headers: {
      "Accept": "application/json",
      "content-type": "application/json",

      // k co header la failed 415
    });
    log("Post Get Product4:" + "$mainUrl/product/loai4");
    log("Response Json GetProduct4: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = ProductResponseModel.fromJson(json.decode(response.body));
      return result;
    } else {

      throw ServerException();
    }

  }



}
