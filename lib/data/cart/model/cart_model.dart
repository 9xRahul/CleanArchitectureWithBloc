class CartModel {
  final int id;
  final List<CartProductModel> products;
  final double total;

  CartModel({required this.id, required this.products, required this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      total: (json['total'] as num).toDouble(),
      products: (json['products'] as List)
          .map((e) => CartProductModel.fromJson(e))
          .toList(),
    );
  }
}

class CartProductModel {
  final int id;
  final String title;
  final int quantity;
  final double price;

  CartProductModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
