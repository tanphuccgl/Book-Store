import 'dart:convert';
import 'dart:developer';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

abstract class CartRemoteDataSource {
  Future<CartResponseModel> getCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({this.client});

  @override
  Future<CartResponseModel> getCart() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl();
  }

  Future<CartResponseModel> _getFromUrl() async {
    log('${getCurrentUser().token}');
    final response = await client.get('$mainUrl/product/cart', headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    });
    log("Get Cart Cart:" + "$mainUrl/product/cart");
    log("Response Json GetCart: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = CartResponseModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw ServerException();
    }
  }
}

http.Client client = http.Client();

Future<bool> deleteProduct({@required String idProduct}) async {
  final response = await client.delete(
    "$mainUrl/product/delete/$idProduct",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
  );
  log("Delete Product:" + "$mainUrl/product/delete/$idProduct");
  log("Response delete Product: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    return true;
  } else {
    throw ServerException();
  }
}

Future<bool> addProduct(
    {@required String idProduct,
    @required String amount,
    @required Function function}) async {
  var body = jsonEncode({'amount': amount});
  final response = await client.post(
    "$mainUrl/product/add/$idProduct",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Add Product:" + "$mainUrl/product/add/$idProduct");
  log("Response Add Product: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    throw ServerException();
  }
}

Future<bool> putProduct(
    {@required String idProduct, @required String amount}) async {
  var body = jsonEncode({'amount': amount});
  final response = await client.put(
    "$mainUrl/product/change/$idProduct",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put Product:" + "$mainUrl/product/add/$idProduct");
  log("Response Put Product: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    return true;
  } else {
    throw ServerException();
  }
}

Future<bool> putIsStatus({
  @required String idProduct,
}) async {
  final response = await client.put(
    "$mainUrl/product/changepayment/$idProduct",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
  );
  log("Put Status Product:" + "$mainUrl/product/changepayment/$idProduct");
  log("Response Status Put Product: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    return true;
  } else {
    throw ServerException();
  }
}

Future<bool> postPayment({Function function}) async {
  final response = await client.post(
    "$mainUrl/product/payment",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
  );
  log("Post Payment:" + "$mainUrl/product/payment");
  log("Response Post Payment: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    throw ServerException();
  }
}
