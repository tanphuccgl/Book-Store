import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/core/utils/constants.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/domain/usecases/get_cart.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_event.dart';
import 'package:book_store/feature/cart/presentation/manager/cart_state.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCart getCart;

  // final GetLocalProfile getLocalProfile;

  CartBloc({@required GetCart pr})
      : assert(pr != null),
        getCart = pr;

  @override
  CartState get initialState => Empty();

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is GetCartE) {

      yield Loading();
      final failureOrSuccess = await getCart(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrSuccess);
      print(failureOrSuccess);
    }

  }



  Stream<CartState> _eitherLoadedOrErrorState(
      Either<Failure, CartResponseModel> failureOrSuccess) async* {

    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (res) =>
              Loaded(swagger: res, data: res.cart,tongSanpham: res.tongSanpham),
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
