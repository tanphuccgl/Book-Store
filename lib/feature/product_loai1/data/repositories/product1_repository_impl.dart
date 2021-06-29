import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai1/data/data_sources/product1_remote_data_source.dart';
import 'package:book_store/feature/product_loai1/domain/repositories/product1_repository.dart';

import 'package:dartz/dartz.dart';

class Product1RepositoryImpl extends Product1Repository {
  final NetworkInfo networkInfo;
  final Product1RemoteDataSource product1RemoteDataSource;


  Product1RepositoryImpl({
    this.networkInfo,
    this.product1RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct1() {
    return _getProduct(product1RemoteDataSource.getProduct1());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct1) async {
    if (await networkInfo.isConnected) {
      try {
        final product1 = await getProduct1;
        return Right(product1);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
