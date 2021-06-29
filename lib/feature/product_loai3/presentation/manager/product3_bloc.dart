import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:book_store/feature/product_loai3/domain/usecases/get_product3.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_event.dart';
import 'package:book_store/feature/product_loai3/presentation/manager/product3_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product3Bloc extends Bloc<Product3Event, Product3State> {
  final GetProduct3 getProduct3;

  // final GetLocalProfile getLocalProfile;

  Product3Bloc({@required GetProduct3 pr})
      : assert(pr != null),
        getProduct3 = pr;

  @override
  Product3State get initialState => Empty();

  @override
  Stream<Product3State> mapEventToState(Product3Event event) async* {
    if (event is GetProduct3E) {
      yield Loading();
      final failureOrSuccess = await getProduct3(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product3State> _eitherLoadedOrErrorState(
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
