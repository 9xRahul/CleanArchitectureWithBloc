import 'package:clean_architecture_with_bloc/core/api_urls/api_urls.dart';
import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/products/models/category/category_model.dart';

class CategoryRemoteDataSource {
  final ApiClient apiClient;

  CategoryRemoteDataSource(this.apiClient);
  Future<List<CategoryModel>> getCategories() async {
    final String path = ApiUrls.getCategories;

    final response = await apiClient.getApi(path: path);

    final List list = response as List;

    return list.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
