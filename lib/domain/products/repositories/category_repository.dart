import 'package:clean_architecture_with_bloc/domain/products/entities/poduct_category_entity/category_entiry.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
}
