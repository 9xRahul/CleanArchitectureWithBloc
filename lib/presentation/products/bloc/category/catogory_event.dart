abstract class CategoryEvent {}

class FetchCategoriesEvent extends CategoryEvent {}

class SelectCategoryEvent extends CategoryEvent {
  final String category;

  SelectCategoryEvent(this.category);
}
