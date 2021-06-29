import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:book_store/feature/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfile implements UseCase<ProfileResponseModel, NoParams>{
  final ProfileRepository profileRepository;

  GetProfile(this.profileRepository);

  @override
  Future<Either<Failure, ProfileResponseModel>> call(NoParams params) async {
    return await profileRepository.getProfile();
  }
}