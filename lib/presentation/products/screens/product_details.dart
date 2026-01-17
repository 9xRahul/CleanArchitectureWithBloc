import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image slider
            SizedBox(
              height: 300,
              child: PageView.builder(
                itemCount: product.images?.length ?? 1,
                itemBuilder: (_, index) {
                  final image = product.images?.isNotEmpty == true
                      ? product.images![index]
                      : product.thumbnail;

                  return Image.network(image, fit: BoxFit.cover);
                },
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titlePriceSection(),

                  _ratingStockSection(),

                  _sectionTitle("Description"),
                  Text(product.description),

                  _sectionTitle("Product Details"),
                  _infoTile("Brand", product.brand),
                  _infoTile("Category", product.category),
                  _infoTile("SKU", product.sku),
                  _infoTile("Weight", "${product.weight ?? '-'} g"),
                  _infoTile(
                    "Minimum Order",
                    product.minimumOrderQuantity?.toString(),
                  ),

                  if (product.dimensions != null)
                    _infoTile(
                      "Dimensions",
                      "${product.dimensions!.width} x ${product.dimensions!.height} x ${product.dimensions!.depth}",
                    ),

                  _infoTile("Warranty", product.warrantyInformation),
                  _infoTile("Shipping", product.shippingInformation),
                  _infoTile("Return Policy", product.returnPolicy),
                  _infoTile("Availability", product.availabilityStatus),

                  if (product.meta != null) ...[
                    _sectionTitle("Meta"),
                    _infoTile("Barcode", product.meta!.barcode),
                    _infoTile("QR Code", product.meta!.qrCode),
                  ],

                  if (product.tags?.isNotEmpty == true) ...[
                    _sectionTitle("Tags"),
                    Wrap(
                      spacing: 6,
                      children: product.tags!
                          .map((e) => Chip(label: Text(e)))
                          .toList(),
                    ),
                  ],

                  if (product.reviews?.isNotEmpty == true) ...[
                    _sectionTitle("Reviews"),
                    ...product.reviews!.take(3).map(_reviewTile),
                  ],

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titlePriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              "₹ ${product.price}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 10),
            if (product.discountPercentage != null)
              Text(
                "${product.discountPercentage}% OFF",
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ],
    );
  }

  Widget _ratingStockSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 18),
          const SizedBox(width: 4),
          Text(product.rating.toString()),
          const SizedBox(width: 12),
          Text("Stock: ${product.stock}"),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _infoTile(String title, String? value) {
    if (value == null || value.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _reviewTile(review) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.reviewerName ?? "User",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(review.rating.toString()),
              ],
            ),
            const SizedBox(height: 4),
            Text(review.comment ?? ""),
          ],
        ),
      ),
    );
  }
}
