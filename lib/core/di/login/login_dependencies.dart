import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/login/data_sourses/auth_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/data/login/repositories/auth_repo_impl.dart';
import 'package:clean_architecture_with_bloc/domain/login/usecases/login_user.dart';

class LoginDependencies {
  late final AuthRemoteDataSource remoteDataSource;
  late final AuthRepositoryImpl repository;
  late final LoginUser loginUser;

  LoginDependencies(ApiClient apiClient) {
    remoteDataSource = AuthRemoteDataSource(apiClient);
    repository = AuthRepositoryImpl(remoteDataSource);
    loginUser = LoginUser(repository);
  }
}
