import 'package:clean_architecture_with_bloc/core/error/api_exceptions.dart';
import 'package:clean_architecture_with_bloc/domain/login/usecases/login_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc(this.loginUser) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      print(event.username);
      final user = await loginUser(event.username, event.password);

      emit(LoginSuccess(user.token));
    } on AppException catch (e) {
      emit(LoginFailure(e.message.toString(), e.statusCode));
    }
  }
}
