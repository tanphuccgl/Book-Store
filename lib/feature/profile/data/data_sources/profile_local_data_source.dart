import 'dart:convert';

import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileData> getProfile();

  Future<void> saveProfile(ProfileData profileData);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({this.sharedPreferences});


  @override
  Future<ProfileData> getProfile() {
    final jsonString = sharedPreferences.getString(SAVE_PROFILE_RESPONSE);
    if(jsonString != null && jsonString!=''){
      return Future.value(ProfileData.fromJson(json.decode(jsonString)));
    } else{
      throw CacheException();
    }
  }

  @override
  Future<void> saveProfile(ProfileData profileData) {
    return sharedPreferences.setString(
        SAVE_PROFILE_RESPONSE,
        json.encode(profileData.toJson()));
  }

}
