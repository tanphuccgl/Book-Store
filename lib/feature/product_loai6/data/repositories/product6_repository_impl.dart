import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai6/data/data_sources/product6_remote_data_source.dart';
import 'package:book_store/feature/product_loai6/domain/repositories/product6_repository.dart';

import 'package:dartz/dartz.dart';

class Product6RepositoryImpl extends Product6Repository {
  final NetworkInfo networkInfo;
  final Product6RemoteDataSource product6RemoteDataSource;


  Product6RepositoryImpl({
    this.networkInfo,
    this.product6RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct6() {
    return _getProduct(product6RemoteDataSource.getProduct6());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct6) async {
    if (await networkInfo.isConnected) {
      try {
        final product6 = await getProduct6;
        return Right(product6);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
