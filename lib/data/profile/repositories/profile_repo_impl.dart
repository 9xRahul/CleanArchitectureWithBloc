import 'package:clean_architecture_with_bloc/core/storage/secure_auth_storage.dart';
import 'package:clean_architecture_with_bloc/data/profile/data_sources/profile_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/data/profile/mappers/logged_in_user_mapper.dart';
import 'package:clean_architecture_with_bloc/domain/profile/entities/logged_in_user_entity.dart';
import 'package:clean_architecture_with_bloc/domain/profile/repositories/profile_repository.dart';

class ProfileRepoImpl implements ProfileRepository {
  final ProfileRemoteDatasource profileRemoteDatasource;
  final SecureAuthStorage storage;

  ProfileRepoImpl(this.profileRemoteDatasource, this.storage);
  @override
  Future<LoggedInUserEntity> getCurrentUSerProfile() async {
    final model = await profileRemoteDatasource.getUserDetails();
    return LoggedInUserMapper.toEntity(model);
  }

  @override
  Future<void> logout() {
    return storage.logout();
  }
}
