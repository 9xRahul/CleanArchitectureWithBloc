import 'package:clean_architecture_with_bloc/data/products/data_sourses/products_remote_datsource.dart';
import 'package:clean_architecture_with_bloc/data/products/mappers/product_mapper.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ProductEntity>> getProducts({String? category}) async {
    final model = await remoteDataSource.getAllProducts(category: category);
    return model.map((model) => ProductMapper.toEntity(model)).toList();
  }

  @override
  Future<List<ProductEntity>> searchproducts({String? query}) async {
    final searchresult = await remoteDataSource.searchProducts(query: query);
    return searchresult.map((e) => ProductMapper.toEntity(e)).toList();
  }
}
