import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai6/domain/repositories/product6_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct6 implements UseCase<ProductResponseModel, NoParams>{
  final Product6Repository product6Repository;

  GetProduct6(this.product6Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product6Repository.getProduct6();
  }
}