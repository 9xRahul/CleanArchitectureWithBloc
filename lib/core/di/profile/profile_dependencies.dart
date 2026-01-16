import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/core/storage/secure_auth_storage.dart';
import 'package:clean_architecture_with_bloc/data/profile/data_sources/profile_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/data/profile/repositories/profile_repo_impl.dart';
import 'package:clean_architecture_with_bloc/domain/profile/usecases/get_profile.dart';
import 'package:clean_architecture_with_bloc/domain/profile/usecases/logout_user.dart';

class ProfileDependencies {
  late final ProfileRemoteDatasource profileRemoteDatasource;
  late final ProfileRepoImpl profileRepoImpl;
  late final GetProfile getProfile;
  late final LogoutUser logoutUser;
  late final SecureAuthStorage storage;
  ProfileDependencies(ApiClient apiClient) {
    profileRemoteDatasource = ProfileRemoteDatasource(apiClient);
    storage = SecureAuthStorage();
    profileRepoImpl = ProfileRepoImpl(profileRemoteDatasource, storage);
    logoutUser = LogoutUser(profileRepoImpl);
    getProfile = GetProfile(profileRepoImpl);
  }
}
