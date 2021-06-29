import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai4/data/data_sources/product4_remote_data_source.dart';
import 'package:book_store/feature/product_loai4/domain/repositories/product4_repository.dart';

import 'package:dartz/dartz.dart';

class Product4RepositoryImpl extends Product4Repository {
  final NetworkInfo networkInfo;
  final Product4RemoteDataSource product4RemoteDataSource;


  Product4RepositoryImpl({
    this.networkInfo,
    this.product4RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct4() {
    return _getProduct(product4RemoteDataSource.getProduct4());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct4) async {
    if (await networkInfo.isConnected) {
      try {
        final product4 = await getProduct4;
        return Right(product4);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
