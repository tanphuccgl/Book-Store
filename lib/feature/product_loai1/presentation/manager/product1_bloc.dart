import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:book_store/feature/product_loai1/domain/usecases/get_product1.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_event.dart';
import 'package:book_store/feature/product_loai1/presentation/manager/product1_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product1Bloc extends Bloc<Product1Event, Product1State> {
  final GetProduct1 getProduct1;

  // final GetLocalProfile getLocalProfile;

  Product1Bloc({@required GetProduct1 pr})
      : assert(pr != null),
        getProduct1 = pr;

  @override
  Product1State get initialState => Empty();

  @override
  Stream<Product1State> mapEventToState(Product1Event event) async* {
    if (event is GetProduct1E) {
      yield Loading();
      final failureOrSuccess = await getProduct1(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product1State> _eitherLoadedOrErrorState(
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
