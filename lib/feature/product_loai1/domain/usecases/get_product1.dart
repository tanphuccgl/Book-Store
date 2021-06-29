import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai1/domain/repositories/product1_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct1 implements UseCase<ProductResponseModel, NoParams>{
  final Product1Repository product1Repository;

  GetProduct1(this.product1Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product1Repository.getProduct1();
  }
}