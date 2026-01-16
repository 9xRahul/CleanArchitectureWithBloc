import 'package:clean_architecture_with_bloc/domain/profile/entities/logged_in_user_entity.dart';

abstract class ProfileRepository {
  Future<LoggedInUserEntity> getCurrentUSerProfile();
  Future<void> logout();
}
