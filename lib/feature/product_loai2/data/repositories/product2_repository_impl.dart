import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai2/data/data_sources/product2_remote_data_source.dart';
import 'package:book_store/feature/product_loai2/domain/repositories/product2_repository.dart';


import 'package:dartz/dartz.dart';

class Product2RepositoryImpl extends Product2Repository {
  final NetworkInfo networkInfo;
  final Product2RemoteDataSource product2RemoteDataSource;


  Product2RepositoryImpl({
    this.networkInfo,
    this.product2RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct2() {
    return _getProduct(product2RemoteDataSource.getProduct2());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct2) async {
    if (await networkInfo.isConnected) {
      try {
        final product2 = await getProduct2;
        return Right(product2);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
