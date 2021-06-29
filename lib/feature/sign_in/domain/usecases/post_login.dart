import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/sign_in/data/models/login_data.dart';
import 'package:book_store/feature/sign_in/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PostLogin implements UseCase<LoginData, LoginParams> {
  final LoginRepository loginRepository;

  PostLogin({@required this.loginRepository});

  @override
  Future<Either<Failure, LoginData>> call(LoginParams params) async {
    return await loginRepository.postLogin(params.email, params.pass);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String pass;

  LoginParams({@required this.email, @required this.pass});

  @override
  // TODO: implement props
  List<Object> get props => [email, pass];
}
