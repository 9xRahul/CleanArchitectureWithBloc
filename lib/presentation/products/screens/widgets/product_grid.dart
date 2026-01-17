import 'package:clean_architecture_with_bloc/core/routes/route_names.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/presentation/products/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductGridCard extends StatelessWidget {
  final ProductEntity product;

  const ProductGridCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped");
        Navigator.pushNamed(
          context,
          RouteNames.productDetails,
          arguments: product,
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                product.thumbnail,
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Price
                  Text(
                    "₹ ${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Rating & Stock
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.orange),
                      Text(product.rating.toString()),

                      const Spacer(),

                      Text(
                        product.stock > 0 ? "In stock" : "Out",
                        style: TextStyle(
                          fontSize: 12,
                          color: product.stock > 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
