import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai3/data/data_sources/product3_remote_data_source.dart';
import 'package:book_store/feature/product_loai3/domain/repositories/product3_repository.dart';

import 'package:dartz/dartz.dart';

class Product3RepositoryImpl extends Product3Repository {
  final NetworkInfo networkInfo;
  final Product3RemoteDataSource product3RemoteDataSource;


  Product3RepositoryImpl({
    this.networkInfo,
    this.product3RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct3() {
    return _getProduct(product3RemoteDataSource.getProduct3());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct3) async {
    if (await networkInfo.isConnected) {
      try {
        final product3 = await getProduct3;
        return Right(product3);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
