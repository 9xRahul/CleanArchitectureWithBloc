import 'package:clean_architecture_with_bloc/data/cart/model/cart_model.dart';
import 'package:clean_architecture_with_bloc/domain/cart/entity/cart_entity.dart';

class CartMapper {
  static CartEntity toEntity(CartModel model) {
    return CartEntity(
      id: model.id,
      total: model.total,
      items: model.products
          .map(
            (p) => CartItemEntity(
              productId: p.id,
              title: p.title,
              quantity: p.quantity,
              price: p.price,
            ),
          )
          .toList(),
    );
  }
}
