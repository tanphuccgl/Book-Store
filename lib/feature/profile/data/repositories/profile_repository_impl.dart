import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_local_data_source.dart';
import 'package:book_store/feature/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:book_store/feature/profile/domain/repositories/profile_repository.dart';


import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileLocalDataSource profileLocalDataSource;
  final ProfileRemoteDataSource profileRemoteDataSource;


  ProfileRepositoryImpl({
    this.networkInfo,
    this.profileLocalDataSource,
    this.profileRemoteDataSource,
  });

  @override
  Future<Either<Failure, ProfileData>> getCurrentProfile() {
    return _getProfile1();
  }
  @override
  Future<Either<Failure, ProfileResponseModel>> getProfile() {
    return _getProfile(profileRemoteDataSource.getProfile());
  }
  Future<Either<Failure, ProfileData>> _getProfile1() async {
    try {
      final result = await profileLocalDataSource.getProfile();
      return Right(result);
    } on CacheException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, ProfileResponseModel>> _getProfile(
      Future<ProfileResponseModel> getProfile) async {
    if (await networkInfo.isConnected) {
      try {
        final profile = await getProfile;
        return Right(profile);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
