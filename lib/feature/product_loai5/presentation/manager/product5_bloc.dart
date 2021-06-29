import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:book_store/feature/product_loai5/domain/usecases/get_product5.dart';
import 'package:book_store/feature/product_loai5/presentation/manager/product5_event.dart';
import 'package:book_store/feature/product_loai5/presentation/manager/product5_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product5Bloc extends Bloc<Product5Event, Product5State> {
  final GetProduct5 getProduct5;

  // final GetLocalProfile getLocalProfile;

  Product5Bloc({@required GetProduct5 pr})
      : assert(pr != null),
        getProduct5 = pr;

  @override
  Product5State get initialState => Empty();

  @override
  Stream<Product5State> mapEventToState(Product5Event event) async* {
    if (event is GetProduct5E) {
      yield Loading();
      final failureOrSuccess = await getProduct5(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product5State> _eitherLoadedOrErrorState(
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
