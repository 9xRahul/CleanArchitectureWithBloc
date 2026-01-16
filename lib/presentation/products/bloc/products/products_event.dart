part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class FetchProducts extends ProductsEvent {
  final String category;

  FetchProducts({required this.category});
}

class ClearProductsList extends ProductsEvent {}
