import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';
import 'package:book_store/feature/sign_in/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetCurrentUser implements UseCase<LoginData,NoParams>{
  final LoginRepository loginRepository;

  GetCurrentUser({@required this.loginRepository});
  @override
  Future<Either<Failure, LoginData>> call(NoParams params)async {
    return await loginRepository.getCurrentUser();
  }

}