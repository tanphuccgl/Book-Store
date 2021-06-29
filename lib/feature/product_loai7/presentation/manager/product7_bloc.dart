import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:book_store/feature/product_loai7/domain/usecases/get_product7.dart';
import 'package:book_store/feature/product_loai7/presentation/manager/product7_event.dart';
import 'package:book_store/feature/product_loai7/presentation/manager/product7_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product7Bloc extends Bloc<Product7Event, Product7State> {
  final GetProduct7 getProduct7;

  // final GetLocalProfile getLocalProfile;

  Product7Bloc({@required GetProduct7 pr})
      : assert(pr != null),
        getProduct7 = pr;

  @override
  Product7State get initialState => Empty();

  @override
  Stream<Product7State> mapEventToState(Product7Event event) async* {
    if (event is GetProduct7E) {
      yield Loading();
      final failureOrSuccess = await getProduct7(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product7State> _eitherLoadedOrErrorState(
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
