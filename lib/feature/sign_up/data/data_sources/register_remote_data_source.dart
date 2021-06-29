import 'dart:convert';
import 'dart:developer';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/sign_up/data/models/register_data.dart';
import 'package:book_store/feature/sign_up/data/models/register_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  Future<RegisterData> register(String name, String email, String pass);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client client;

  RegisterRemoteDataSourceImpl({@required this.client});

  @override
  Future<RegisterData> register(String name, String email, String pass) {
    return _register(name, email, pass);
  }

  Future<RegisterData> _register(
    String name,
    String email,
    String pass,
  ) async {
    var body = jsonEncode({'email': email, 'password': pass, "name": name});
    final response = await client
        .post('$mainUrl/account/register',
            headers: {
              "Accept": "application/json",
              "content-type": "application/json" // k co header la failed 415
            },
            body: body)
        .timeout(Duration(seconds: 15));
    log("Post Register:" + "$mainUrl/account/register");
    log("Post Body Register:" + body);
    log("Response Json Register: ${json.decode(response.body)}");

    if (response.statusCode == 200) {
      var success = RegisterResponseModel.fromJson(json.decode(response.body));

      return success.data;
    } else {
      throw ServerException();
    }
  }
}
