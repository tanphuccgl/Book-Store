import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:book_store/feature/cart/data/models/cart_response_model.dart';
import 'package:book_store/feature/cart/domain/repositories/cart_repository.dart';

import 'package:dartz/dartz.dart';

class CartRepositoryImpl extends CartRepository {
  final NetworkInfo networkInfo;
  final CartRemoteDataSource cartRemoteDataSource;


  CartRepositoryImpl({
    this.networkInfo,
    this.cartRemoteDataSource,
  });

  @override
  Future<Either<Failure, CartResponseModel>> getCart(){
    return _getCart(cartRemoteDataSource.getCart());
  }


  Future<Either<Failure, CartResponseModel>> _getCart(
      Future<CartResponseModel> getCart) async {
    if (await networkInfo.isConnected) {
      try {
        final cart = await getCart;
        return Right(cart);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
