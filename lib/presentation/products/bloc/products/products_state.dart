part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoadSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsLoadSuccess({required this.products});
}

final class ProductLoadingError extends ProductsState {
  final int statusCode;
  final String message;

  ProductLoadingError({required this.statusCode, required this.message});
}

