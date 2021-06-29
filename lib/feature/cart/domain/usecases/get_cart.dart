import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/domain/repositories/cart_repository.dart';

import 'package:dartz/dartz.dart';

class GetCart implements UseCase<CartResponseModel, NoParams>{
  final CartRepository cartRepository;

  GetCart(this.cartRepository);

  @override
  Future<Either<Failure, CartResponseModel>> call(NoParams params) async {
    return await cartRepository.getCart();
  }
}