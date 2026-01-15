import 'package:clean_architecture_with_bloc/core/enums/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/storage/secure_auth_storage.dart';

class AppStartCubit extends Cubit<AuthState> {
  final SecureAuthStorage storage;

  AppStartCubit(this.storage) : super(AuthState.loading);

  Future<void> checkAuth() async {
    final loggedIn = await storage.isLoggedIn();

    emit(loggedIn ? AuthState.authenticated : AuthState.unauthenticated);
  }
}
