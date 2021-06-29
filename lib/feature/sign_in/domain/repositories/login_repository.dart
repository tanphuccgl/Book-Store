import 'package:book_store/core/error/failures.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{
  Future<Either<Failure,LoginData>> postLogin(String email,String pass);
  Future<Either<Failure,LoginData>> getCurrentUser();

}