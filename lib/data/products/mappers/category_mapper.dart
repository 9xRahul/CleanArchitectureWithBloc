import 'package:clean_architecture_with_bloc/data/products/models/category/category_model.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/poduct_category_entity/category_entiry.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(name: model.name);
  }

  static List<CategoryEntity> toEntityList(List<CategoryModel> models) {
    return models.map(toEntity).toList();
  }
}
