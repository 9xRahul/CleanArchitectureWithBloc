import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/products/data_sourses/category_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/data/products/repositories/category_repo_impl.dart';
import 'package:clean_architecture_with_bloc/domain/products/usecases/get_categories.dart';
import 'package:clean_architecture_with_bloc/presentation/products/bloc/category/catogory_bloc.dart';

class CategoryDependencies {
  late final CategoryRemoteDataSource remoteDataSource;
  late final CategoryRepositoryImpl repository;
  late final GetCategories getCategories;
  late final CategoryBloc categoryBloc;

  CategoryDependencies(ApiClient apiClient) {
    remoteDataSource = CategoryRemoteDataSource(apiClient);
    repository = CategoryRepositoryImpl(remoteDataSource);
    getCategories = GetCategories(repository);
    categoryBloc = CategoryBloc(getCategories);
  }
}
