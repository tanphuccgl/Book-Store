import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';
import 'package:book_store/feature/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProduct implements UseCase<ProductResponseModel, NoParams>{
  final ProductRepository productRepository;

  GetProduct(this.productRepository);

  @override
  Future<Either<Failure, ProductResponseModel>> call(NoParams params) async {
    return await productRepository.getProduct();
  }
}