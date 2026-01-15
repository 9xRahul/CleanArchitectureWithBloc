import 'package:clean_architecture_with_bloc/domain/products/entities/product_entity.dart';

class ProductsResponseEntity {
  final List<ProductEntity> products;
  final int total;
  final int skip;
  final int limit;

  const ProductsResponseEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}
