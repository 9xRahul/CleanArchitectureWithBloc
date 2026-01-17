import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/products/data_sourses/products_remote_datsource.dart';
import 'package:clean_architecture_with_bloc/data/products/repositories/product_repo_impl.dart';
import 'package:clean_architecture_with_bloc/domain/products/usecases/get_products.dart';
import 'package:clean_architecture_with_bloc/domain/products/usecases/search_products.dart';

class ProductDependencies {
  late final ProductRemoteDataSource prodcutRemoteDataSource;
  late final ProductRepositoryImpl productRepositoryImpl;
  late final GetProducts getProducts;
  late final SearchProduct searchProducts;

  ProductDependencies(ApiClient apiClient) {
    prodcutRemoteDataSource = ProductRemoteDataSource(apiClient);
    productRepositoryImpl = ProductRepositoryImpl(prodcutRemoteDataSource);
    getProducts = GetProducts(productRepositoryImpl);
    searchProducts = SearchProduct(productRepositoryImpl);
  }
}
