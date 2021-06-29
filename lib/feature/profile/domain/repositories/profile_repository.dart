import 'package:book_store/core/error/failures.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';

import 'package:dartz/dartz.dart';

abstract class ProfileRepository{
  Future<Either<Failure, ProfileResponseModel>> getProfile();
  Future<Either<Failure,ProfileData>> getCurrentProfile();



}
