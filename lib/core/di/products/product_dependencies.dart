import 'package:clean_architecture_with_bloc/core/network/api_client.dart';
import 'package:clean_architecture_with_bloc/data/products/data_sourses/products_remote_datsource.dart';
import 'package:clean_architecture_with_bloc/data/products/repositories/product_repo_impl.dart';
import 'package:clean_architecture_with_bloc/domain/products/repositories/product_repository.dart';
import 'package:clean_architecture_with_bloc/domain/products/usecases/get_products.dart';

class ProductDependencies {
  late final ProdcutRemoteDataSource prodcutRemoteDataSource;
  late final ProductRepositoryImpl productRepositoryImpl;
  late final GetProducts getProducts;

  ProductDependencies(ApiClient apiClient) {
    prodcutRemoteDataSource = ProdcutRemoteDataSource(apiClient);
    productRepositoryImpl = ProductRepositoryImpl(prodcutRemoteDataSource);
    getProducts = GetProducts(productRepositoryImpl);
  }
}
