import 'package:book_store/core/error/failures.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository{
  Future<Either<Failure, CartResponseModel>> getCart();



}
