import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
abstract class ProfileRemoteDataSource {
  Future<ProfileResponseModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final http.Client client;

  ProfileRemoteDataSourceImpl({this.client});

  @override
  Future<ProfileResponseModel> getProfile() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl();
  }

  Future<ProfileResponseModel> _getFromUrl() async {
    final response = await client.get('$mainUrl/account', headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    });
    log("Post Get Profile:" + "$mainUrl/account");
    log("Response Json GetProfile: ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = ProfileResponseModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw ServerException();
    }
  }
}

http.Client client = http.Client();

Future<bool> changeProfile(
    {@required String name,
    @required String address,
    @required String phoneNumber,
    @required String dateBirth,
    @required String sex,
    @required String introduce,
    Function function,
    Function function2}) async {
  var body = jsonEncode({
    'name': name,
    'address': address,
    'phoneNumber': phoneNumber,
    'dateBirth': dateBirth,
    'sex': sex,
    'introduce': introduce,
  });
  final response = await client.put(
    "$mainUrl/account/changeinformation",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },
    body: body,
  );
  log("Put ChangeProfile:" + "$mainUrl/account/changeinformation");
  log("Response Put ChangeProfile: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function2();
    throw ServerException();
  }
}

void uploadImage(File imageFile) async {
  var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();
  var headers = {
    "Content-type": "multipart/form-data",
    'auth-token': '${getCurrentUser().token}',  };
  var uri = Uri.parse('http://45.77.12.16:4000/account/uploadavatar');
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('file', stream, length,
      contentType: new MediaType('image','jpeg',),
      filename: basename(imageFile.path));
  //contentType: new MediaType('image', 'png'));
  request.headers.addAll(headers);
  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
Future<bool> putChangePw({@required Function function,@required Function function1,
  @required String password,
  @required String newPassword ,
}) async {
  var body = jsonEncode({
    'password': password,
    'newPassword': newPassword ,

  });
  final response = await client.put(
    "$mainUrl/account/changepassword",
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'auth-token': '${getCurrentUser().token}',
      // k co header la failed 415
    },body: body,
  );
  log("Put Change Pw: " + "$mainUrl/account/changepassword");
  log("Response Put Change Pw: ${response.statusCode}");
  if (response.statusCode == 200 || response.statusCode == 201) {
    function();
    return true;
  } else {
    function1();
    throw ServerException();
  }
}

