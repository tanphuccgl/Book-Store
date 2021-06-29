import 'package:book_store/core/error/failures.dart';
import 'package:book_store/core/usecase/usecase.dart';
import 'package:book_store/feature/sign_up/data/models/register_data.dart';
import 'package:book_store/feature/sign_up/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PostRegister implements UseCase<RegisterData, RegisterParams> {
  final RegisterRepository registerRepository;

  PostRegister({@required this.registerRepository});

  @override
  Future<Either<Failure, RegisterData>> call(RegisterParams params) async {
    return await registerRepository.postRegister(
        params.name, params.email, params.pass);
  }
}

class RegisterParams extends Equatable {
  final String email;
  final String pass;
  final String name;

  RegisterParams({this.email, this.pass, this.name});

  @override
  // TODO: implement props
  List<Object> get props => [email, pass];
}
