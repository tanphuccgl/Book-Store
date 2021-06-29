import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product_loai5/domain/repositories/product5_repository.dart';

import 'package:dartz/dartz.dart';

class GetProduct5 implements UseCase<ProductResponseModel, NoParams>{
  final Product5Repository product5Repository;

  GetProduct5(this.product5Repository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await product5Repository.getProduct5();
  }
}