import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProfile {
  ApiProfile._();

  static Future<ProfileResponseModel> getData() async {
    try {
      final response = await Dio().get('$mainUrl/account',options: new Options(headers:
      {
        'auth-token': '${getCurrentUser().token}',
      }));

      print("aaa ${response.data}");
      return ProfileResponseModel.fromJson(response.data);

      //return (reponse.data as List).map((e) => Country.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e);
    }
  }



}