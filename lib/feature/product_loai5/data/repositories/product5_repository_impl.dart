import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai5/data/data_sources/product5_remote_data_source.dart';
import 'package:book_store/feature/product_loai5/domain/repositories/product5_repository.dart';

import 'package:dartz/dartz.dart';

class Product5RepositoryImpl extends Product5Repository {
  final NetworkInfo networkInfo;
  final Product5RemoteDataSource product5RemoteDataSource;


  Product5RepositoryImpl({
    this.networkInfo,
    this.product5RemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct5() {
    return _getProduct(product5RemoteDataSource.getProduct5());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct5) async {
    if (await networkInfo.isConnected) {
      try {
        final product5 = await getProduct5;
        return Right(product5);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
