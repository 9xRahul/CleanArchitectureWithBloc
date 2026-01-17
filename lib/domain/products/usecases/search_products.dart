import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/repositories/product_repository.dart';

class SearchProduct {
  final ProductRepository productRepository;

  SearchProduct(this.productRepository);

  Future<List<ProductEntity>> call({required String query}) {
    return productRepository.searchproducts(query: query);
  }
}
