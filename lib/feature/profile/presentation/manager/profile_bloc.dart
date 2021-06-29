import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/profile/data/models/profile_data.dart';
import 'package:book_store/feature/profile/data/models/profile_response_model.dart';
import 'package:book_store/feature/profile/domain/usecases/get_current_profile.dart';
import 'package:book_store/feature/profile/domain/usecases/get_profile.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_event.dart';
import 'package:book_store/feature/profile/presentation/manager/profile_state.dart';


import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final GetCurrentProfile getCurrentProfile;

  // final GetLocalProfile getLocalProfile;

  ProfileBloc({@required GetProfile pr,@required GetCurrentProfile cu})
      : assert(pr != null),
        assert(cu != null),
        getCurrentProfile = cu,
        getProfile = pr;

  @override
  ProfileState get initialState => Empty();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetProfileE) {

      yield Loading();

      final failureOrSuccess = await getProfile(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }
    else if(event is IsProfile)
      {
        yield Loading();
        final result= await getCurrentProfile(NoParams());
        yield* _eitherProfileOrErrorState(result);
      }

  }
  Stream<ProfileState> _eitherProfileOrErrorState(
      Either<Failure, ProfileData> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => NotProfile(),
          (res) => ProfileAlready(),
    );
  }



  Stream<ProfileState> _eitherLoadedOrErrorState(
      Either<Failure, ProfileResponseModel> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (res) => Loaded(swagger: res, data: res.data),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
