import 'package:clean_architecture_with_bloc/data/products/data_sourses/category_remote_datasource.dart';
import 'package:clean_architecture_with_bloc/data/products/mappers/category_mapper.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/poduct_category_entity/category_entiry.dart';

import '../../../domain/products/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final model = await remoteDataSource.getCategories();

    return CategoryMapper.toEntityList(model);
  }
}
