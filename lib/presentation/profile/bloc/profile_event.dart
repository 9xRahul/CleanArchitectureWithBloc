part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileFetchingEvent extends ProfileEvent {}

class LogoutEvent extends ProfileEvent {}
