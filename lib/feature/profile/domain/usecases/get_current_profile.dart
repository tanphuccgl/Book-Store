
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetCurrentProfile implements UseCase<ProfileData,NoParams>{
  final ProfileRepository profileRepository;

  GetCurrentProfile({@required this.profileRepository});
  @override
  Future<Either<Failure, ProfileData>> call(NoParams params)async {
    return await profileRepository.getCurrentProfile();
  }

}