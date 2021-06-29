import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai7/domain/repositories/product7_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct7 implements UseCase<ProductResponseModel, NoParams>{
  final Product7Repository product7Repository;

  GetProduct7(this.product7Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product7Repository.getProduct7();
  }
}