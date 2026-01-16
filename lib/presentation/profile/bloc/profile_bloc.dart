import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_with_bloc/core/error/api_exceptions.dart';

import 'package:clean_architecture_with_bloc/domain/profile/entities/logged_in_user_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/usecases/get_profile.dart';
import 'package:clean_architecture_with_bloc/domain/profile/usecases/logout_user.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final LogoutUser logoutUser;

  LoggedInUserEntity? cachedUserProfile;
  ProfileBloc(this.getProfile, this.logoutUser) : super(ProfileInitial()) {
    on<ProfileFetchingEvent>(_onfetchProfile);
    on<LogoutEvent>(_onLogout);
  }

  FutureOr<void> _onfetchProfile(
    ProfileFetchingEvent event,
    Emitter<ProfileState> emit,
  ) async {
    if (cachedUserProfile != null) {
      emit(ProfileLogingSuccess(cachedUserProfile!));
      return;
    }
    emit(ProfileLoding());
    try {
      final currentUser = await getProfile.get();
      cachedUserProfile = currentUser;
      emit(ProfileLogingSuccess(currentUser));
    } on AppException catch (e) {
      emit(ProfileLoddingError(e.statusCode, e.message.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(LogoutLoading());

    try {
      await logoutUser.call(); // delete token
      cachedUserProfile = null; // clear cache
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure("Logout failed"));
    }
  }
}
