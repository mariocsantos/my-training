import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'LoginButtonPressed { email: $email, password: $password }';
}

class LoginWithGoogle extends LoginEvent {}

class LoginWithFacebook extends LoginEvent {}
