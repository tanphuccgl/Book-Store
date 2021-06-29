import 'package:book_store/feature/sign_up/data/models/register_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Empty extends RegisterState{}
class Loading  extends RegisterState{}
class Loaded extends RegisterState{
  final RegisterData data;
  Loaded({this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}
class Error extends RegisterState{
  final String message;
  Error({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
class RegisterAlready extends RegisterState{}
class NotRegister extends RegisterState{}
