import 'package:clean_architecture_with_bloc/domain/login/repositories/auth_repository.dart';
import 'package:clean_architecture_with_bloc/domain/profile/repositories/profile_repository.dart';

class LogoutUser {
  final ProfileRepository repository;

  LogoutUser(this.repository);

  Future<void> call() => repository.logout();
}
