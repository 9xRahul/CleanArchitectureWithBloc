class CartEntity {
  final int id;
  final List<CartItemEntity> items;
  final double total;

  CartEntity({required this.id, required this.items, required this.total});
}

class CartItemEntity {
  final int productId;
  final String title;
  final int quantity;
  final double price;

  CartItemEntity({
    required this.productId,
    required this.title,
    required this.quantity,
    required this.price,
  });
}
