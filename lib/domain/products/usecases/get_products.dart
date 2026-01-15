import 'package:clean_architecture_with_bloc/domain/products/entities/product_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository productRepository;
  GetProducts(this.productRepository);

  Future<ProductEntity> call(String? category) {
    return productRepository.getProducts(category: category);
  }
}
