import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:book_store/feature/product_loai6/domain/usecases/get_product6.dart';
import 'package:book_store/feature/product_loai6/presentation/manager/product6_event.dart';
import 'package:book_store/feature/product_loai6/presentation/manager/product6_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product6Bloc extends Bloc<Product6Event, Product6State> {
  final GetProduct6 getProduct6;

  // final GetLocalProfile getLocalProfile;

  Product6Bloc({@required GetProduct6 pr})
      : assert(pr != null),
        getProduct6 = pr;

  @override
  Product6State get initialState => Empty();

  @override
  Stream<Product6State> mapEventToState(Product6Event event) async* {
    if (event is GetProduct6E) {
      yield Loading();
      final failureOrSuccess = await getProduct6(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product6State> _eitherLoadedOrErrorState(
      Either<Failure, ProductResponseModel> failureOrSuccess) async* {
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
