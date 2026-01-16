import 'package:clean_architecture_with_bloc/domain/profile/entities/logged_in_user_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/repositories/profile_repository.dart';

class GetProfile {
  ProfileRepository profileRepository;
  GetProfile(this.profileRepository);

  Future<LoggedInUserEntity> get() {
    return profileRepository.getCurrentUSerProfile();
  }
}
