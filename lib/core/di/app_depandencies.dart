import 'package:clean_architecture_with_bloc/core/di/login/login_dependencies.dart';

import '../network/api_client.dart';

class AppDependencies {
  late final ApiClient apiClient;
  late final LoginDependencies login;

  AppDependencies() {
    apiClient = ApiClient();

    login = LoginDependencies(apiClient);
  }
}
