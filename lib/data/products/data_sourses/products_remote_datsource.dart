import 'package:clean_architecture_with_bloc/core/api_urls/api_urls.dart';
import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/products/models/products_model.dart';

class ProdcutRemoteDataSource {
  final ApiClient apiClient;

  ProdcutRemoteDataSource(this.apiClient);

  Future<ProductModel> getAllProducts({String? category}) async {
    String path = category!.isEmpty
        ? ApiUrls.getAllProducts
        : "${ApiUrls.getAllProducts}/$category";

    var response = await apiClient.getApi(path: path);
    return ProductModel.fromJson(response);
  }
}
