import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai3/domain/repositories/product3_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct3 implements UseCase<ProductResponseModel, NoParams>{
  final Product3Repository product3Repository;

  GetProduct3(this.product3Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product3Repository.getProduct3();
  }
}