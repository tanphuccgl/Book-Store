import 'dart:convert';
import 'dart:developer';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

http.Client client = http.Client();

Future<bool> putNewPw(
    {@required String email,
    @required String token,
    @required String newPassword,
    Function function,
    Function function2}) async {
  var body = jsonEncode({
    'token': token,
    'newPassword': newPassword,
  });

  final response = await client.put(
    "$mainUrl/account/newpassword/${email}",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",

      // k co header la failed 415
    },
    body: body,
  );
  log("Put New Password:" + "$mainUrl/account/newpassword/${email}");
  log("Response Status New Password : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}

Future<bool> postForgotPw(
    {String email, Function function, Function function2}) async {
  var body = jsonEncode({'email': email});
  final response = await client.post("$mainUrl/account/forgotpassword",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",

        // k co header la failed 415
      },
      body: body);
  log("Post Forgot Pw :" + "$mainUrl/account/forgotpassword");
  log("Response Post Forgot Pw : ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}
