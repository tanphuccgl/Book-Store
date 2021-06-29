import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/sign_up/data/models/register_data.dart';
import 'package:book_store/feature/sign_up/domain/usecases/post_register.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_event.dart';
import 'package:book_store/feature/sign_up/presentation/manager/register_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final PostRegister postRegister;

  RegisterBloc({PostRegister lg})
      : assert(lg != null),
        postRegister = lg;

  @override
  RegisterState get initialState => Empty();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterE) {
      yield Loading();
      final result = await postRegister(RegisterParams(
          name: event.name, email: event.email, pass: event.pass));
      yield* _eitherLoadedOrErrorState(result);
    }


    if (event is ClearE) {
      yield Empty();
    }
  }

  Stream<RegisterState> _eitherLoadedOrErrorState(
      Either<Failure, RegisterData> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (res) => Loaded(data: res),
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
