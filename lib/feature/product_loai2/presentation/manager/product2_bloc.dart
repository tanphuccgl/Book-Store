import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai2/domain/usecases/get_product2.dart';
import 'package:book_store/feature/product_loai2/presentation/manager/product2_event.dart';
import 'package:book_store/feature/product_loai2/presentation/manager/product2_state.dart';



import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product2Bloc extends Bloc<Product2Event, Product2State> {
  final GetProduct2 getProduct2;

  // final GetLocalProfile getLocalProfile;

  Product2Bloc({@required GetProduct2 pr})
      : assert(pr != null),
        getProduct2 = pr;

  @override
  Product2State get initialState => Empty();

  @override
  Stream<Product2State> mapEventToState(Product2Event event) async* {
    if (event is GetProduct2E) {
      yield Loading();
      final failureOrSuccess = await getProduct2(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<Product2State> _eitherLoadedOrErrorState(
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
