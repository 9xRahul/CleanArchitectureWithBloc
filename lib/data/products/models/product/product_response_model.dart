import 'package:clean_architecture_with_bloc/data/products/models/product/products_model.dart';

class ProductsResponseModel {
  List<ProductModel>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    products = (json['products'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();

    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}
