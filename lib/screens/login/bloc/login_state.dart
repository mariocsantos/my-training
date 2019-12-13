import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState {
  final bool isEmailValid;
  final bool isEmailDirty;
  final bool isPasswordValid;
  final bool isPasswordDirty;
  final bool isSubmitting;
  final bool isSuccess;
  final PlatformException error;

  bool get isFormValid => isEmailValid && isPasswordValid;
  bool get isFormDirty => isEmailDirty && isPasswordDirty;

  LoginState({
    @required this.isEmailValid,
    @required this.isEmailDirty,
    @required this.isPasswordValid,
    @required this.isPasswordDirty,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.error,
  });

  factory LoginState.empty() {
    return LoginState(
      isEmailValid: false,
      isEmailDirty: false,
      isPasswordValid: false,
      isPasswordDirty: false,
      isSubmitting: false,
      isSuccess: false,
      error: null,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isEmailDirty: true,
      isPasswordValid: true,
      isPasswordDirty: true,
      isSubmitting: true,
      isSuccess: false,
      error: null,
    );
  }

  factory LoginState.failure(error) {
    return LoginState(
      isEmailValid: true,
      isEmailDirty: true,
      isPasswordValid: true,
      isPasswordDirty: true,
      isSubmitting: false,
      isSuccess: false,
      error: error,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isEmailDirty: true,
      isPasswordValid: true,
      isPasswordDirty: true,
      isSubmitting: false,
      isSuccess: true,
      error: null,
    );
  }

  LoginState update({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isEmailDirty: true,
      isPasswordValid: isPasswordValid,
      isPasswordDirty: true,
      isSubmitting: this.isSubmitting,
      isSuccess: this.isSuccess,
      error: null,
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isEmailDirty,
    bool isPasswordValid,
    bool isPasswordDirty,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    PlatformException error,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isEmailDirty: isEmailDirty ?? this.isEmailDirty,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isPasswordDirty: isPasswordDirty ?? this.isPasswordDirty,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? null,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      isEmailValid: $isEmailValid,
      isEmailDirty: $isEmailDirty,
      isPasswordValid: $isPasswordValid,
      isPasswordDirty: $isPasswordDirty,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      error: $error,
    }''';
  }
}
