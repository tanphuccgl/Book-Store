import 'package:book_store/core/error/failures.dart';
import 'package:book_store/feature/sign_up/data/models/register_data.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository{
  Future<Either<Failure,RegisterData>> postRegister(String name,String email,String pass);


}