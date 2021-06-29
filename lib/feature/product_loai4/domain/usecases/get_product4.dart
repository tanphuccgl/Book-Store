import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai4/domain/repositories/product4_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct4 implements UseCase<ProductResponseModel, NoParams>{
  final Product4Repository product4Repository;

  GetProduct4(this.product4Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product4Repository.getProduct4();
  }
}