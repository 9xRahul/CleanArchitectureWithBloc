import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/usecases/get_products.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;
  ProductsBloc(this.getProducts) : super(ProductsInitial()) {
    on<ProductsEvent>(_fetchProdcus);
  }

  FutureOr<void> _fetchProdcus(
    ProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      List<ProductEntity> prodcuts = await getProducts.call(
        category: "smartphones",
      );

      emit(ProductsLoadSuccess(products: prodcuts));
    } catch (e) {
      emit(ProductLoadingError(message: e.toString(), statusCode: 0));
    }
  }
}
