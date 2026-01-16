import 'package:clean_architecture_with_bloc/domain/products/entities/poduct_category_entity/category_entiry.dart';

import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryEntity>> call() {
    return repository.getCategories();
  }
}
