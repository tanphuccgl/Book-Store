import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product/domain/usecases/get_product.dart';
import 'package:book_store/feature/product/presentation/manager/product_event.dart';
import 'package:book_store/feature/product/presentation/manager/product_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProduct getProduct;

  // final GetLocalProfile getLocalProfile;

  ProductBloc({@required GetProduct pr})
      : assert(pr != null),
        getProduct = pr;

  @override
  ProductState get initialState => Empty();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetProductE) {
      yield Loading();
      final failureOrSuccess = await getProduct(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<ProductState> _eitherLoadedOrErrorState(
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
