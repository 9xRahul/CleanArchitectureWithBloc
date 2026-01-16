part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoding extends ProfileState {}

class ProfileLogingSuccess extends ProfileState {
  final LoggedInUserEntity loggedUser;
  ProfileLogingSuccess(this.loggedUser);
}

class ProfileLoddingError extends ProfileState {
  final int statusCode;
  final String message;

  ProfileLoddingError(this.statusCode, this.message);
}

class LogoutLoading extends ProfileState {}

class LogoutSuccess extends ProfileState {}

class LogoutFailure extends ProfileState {
  final String message;
  LogoutFailure(this.message);
}
