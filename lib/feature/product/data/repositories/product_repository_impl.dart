import 'package:book_store/core/error/exceptions.dart';
import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/network/network_info.dart';
import 'package:book_store/feature/product/data/data_sources/product_remote_data_source.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository {
  final NetworkInfo networkInfo;
  final ProductRemoteDataSource productRemoteDataSource;


  ProductRepositoryImpl({
    this.networkInfo,
    this.productRemoteDataSource,
  });

  @override
  Future<Either<Failure, ProductResponseModel>> getProduct() {
    return _getProduct(productRemoteDataSource.getProduct());
  }


  Future<Either<Failure, ProductResponseModel>> _getProduct(
      Future<ProductResponseModel> getProduct) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await getProduct;
        return Right(product);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }


}
