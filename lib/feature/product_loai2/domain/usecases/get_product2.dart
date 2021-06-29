import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai2/domain/repositories/product2_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct2 implements UseCase<ProductResponseModel, NoParams>{
  final Product2Repository product2Repository;

  GetProduct2(this.product2Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product2Repository.getProduct2();
  }
}