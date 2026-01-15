abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess(this.token);
  
}

class LoginFailure extends LoginState {
  final int statusCode;
  final String message;
  LoginFailure(this.message, this.statusCode);
}
