import 'dart:convert';
import 'dart:developer';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';
import 'package:book_store/feature/sign_in/data/models/login_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginData> login(String email, String pass);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({@required this.client});

  @override
  Future<LoginData> login(String email, String pass) {
    return _login(email, pass);
  }

  Future<LoginData> _login(String email, String pass) async {
    var body = jsonEncode({'email': email, 'password': pass});
    final response = await client
        .post('$mainUrl/account/login',
            headers: {
              "Accept": "application/json",
              "content-type": "application/json" // k co header la failed 415
            },
            body: body)
        .timeout(Duration(seconds: 15));
    log("Post Login:" + "$mainUrl/account/login");
    log("Post body Login:" + body);
    log("Response Json Login: ${json.decode(response.body)}");

    if (response.statusCode == 200) {

      var success = LoginResponseModel.fromJson(json.decode(response.body));

      return success.data;
    } else {
      throw ServerException();
    }
  }
}
