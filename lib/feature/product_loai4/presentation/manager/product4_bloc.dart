import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:book_store/feature/product_loai4/domain/usecases/get_product4.dart';
import 'package:book_store/feature/product_loai4/presentation/manager/product4_event.dart';
import 'package:book_store/feature/product_loai4/presentation/manager/product4_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product4Bloc extends Bloc<Product4Event, Product4State> {
  final GetProduct4 getProduct4;

  // final GetLocalProfile getLocalProfile;

  Product4Bloc({@required GetProduct4 pr})
      : assert(pr != null),
        getProduct4 = pr;

  @override
  Product4State get initialState => Empty();

  @override
  Stream<Product4State> mapEventToState(Product4Event event) async* {
    if (event is GetProduct4E) {
      yield Loading();
      final failureOrSuccess = await getProduct4(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product4State> _eitherLoadedOrErrorState(
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
