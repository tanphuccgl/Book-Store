import 'dart:io';

import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/core/utils/get_current_user.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiViewAvt {
  ApiViewAvt._();

  static Future<bool> getViewAvt({String link}) async {
    FormData formData = new FormData.fromMap({

      "file":  await MultipartFile.fromFile(link,filename: 'a2.jpg')
    });
     var response = await Dio().post( "$mainUrl/account/uploadavatar", data: formData,options: Options(headers: {
       "Content-type": "multipart/form-data",
       'auth-token': '${getCurrentUser().token}',
     }));
     if(response.statusCode==200)
       {
         return true;
       }
  }
}
