import 'package:book_store/core/error/failures.dart';
import 'package:book_store/feature/product/data/models/product_response_model.dart';

import 'package:dartz/dartz.dart';

abstract class Product3Repository{
  Future<Either<Failure, ProductResponseModel>> getProduct3();



}
