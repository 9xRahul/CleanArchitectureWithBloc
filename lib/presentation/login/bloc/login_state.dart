import 'package:clean_architecture_with_bloc/core/enums/auth_state.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final String token;
  final AuthState isAuthenticated;
  LoginLoading({
    this.token = "",
    this.isAuthenticated = AuthState.unauthenticated,
  });
}

class LoginSuccess extends LoginState {
  final String token;
  final AuthState isAuthenticated;
  LoginSuccess(this.token, {this.isAuthenticated = AuthState.unauthenticated});
}

class LoginFailure extends LoginState {
  final int statusCode;
  final String message;
  LoginFailure(this.message, this.statusCode);
}
