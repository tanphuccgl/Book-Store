import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RegisterE extends RegisterEvent{
  final String name;
  final String email;
  final String pass;

  RegisterE(this.name,this.email, this.pass);
  @override
  // TODO: implement props
  List<Object> get props => [email, pass];

}
class ClearE extends RegisterEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class IsRegister extends RegisterEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

