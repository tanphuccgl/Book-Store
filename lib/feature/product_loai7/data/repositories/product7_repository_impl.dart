import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai7/data/data_sources/product7_remote_data_source.dart';
import 'package:book_store/feature/product_loai7/domain/repositories/product7_repository.dart';

import 'package:dartz/dartz.dart';

class Product7RepositoryImpl extends Product7Repository {
  final NetworkInfo networkInfo;
  final Product7RemoteDataSource product7RemoteDataSource;


  Product7RepositoryImpl({
    this.networkInfo,
    this.product7RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct7() {
    return _getProduct(product7RemoteDataSource.getProduct7());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct7) async {
    if (await networkInfo.isConnected) {
      try {
        final product7 = await getProduct7;
        return Right(product7);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
