import 'package:clean_architecture_with_bloc/domain/products/entities/product_entity.dart';

abstract class ProductRepository {
  
  Future<List<ProductEntity>> getProducts({String? category});
}
