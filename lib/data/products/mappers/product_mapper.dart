import 'package:clean_architecture_with_bloc/data/products/models/product/products_model.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/diamenions_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/meta_entiry.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/product_entity.dart';
import 'package:clean_architecture_with_bloc/domain/products/entities/product/review_entity.dart';


class ProductMapper {
  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
      id: model.id!,
      title: model.title ?? '',
      description: model.description ?? '',
      category: model.category ?? '',
      price: model.price ?? 0,
      discountPercentage: model.discountPercentage ?? 0,
      rating: model.rating ?? 0,
      stock: model.stock ?? 0,
      tags: model.tags ?? [],
      brand: model.brand ?? '',
      sku: model.sku ?? '',
      weight: model.weight ?? 0,
      dimensions: model.dimensions == null
          ? null
          : DimensionsEntity(
              width: model.dimensions!.width ?? 0,
              height: model.dimensions!.height ?? 0,
              depth: model.dimensions!.depth ?? 0,
            ),
      warrantyInformation: model.warrantyInformation ?? '',
      shippingInformation: model.shippingInformation ?? '',
      availabilityStatus: model.availabilityStatus ?? '',
      reviews:
          model.reviews
              ?.map(
                (e) => ReviewEntity(
                  rating: e.rating ?? 0,
                  comment: e.comment ?? '',
                  date: e.date ?? '',
                  reviewerName: e.reviewerName ?? '',
                  reviewerEmail: e.reviewerEmail ?? '',
                ),
              )
              .toList() ??
          [],
      returnPolicy: model.returnPolicy ?? '',
      minimumOrderQuantity: model.minimumOrderQuantity ?? 0,
      meta: model.meta == null
          ? null
          : MetaEntity(
              createdAt: model.meta!.createdAt ?? '',
              updatedAt: model.meta!.updatedAt ?? '',
              barcode: model.meta!.barcode ?? '',
              qrCode: model.meta!.qrCode ?? '',
            ),
      images: model.images ?? [],
      thumbnail: model.thumbnail ?? '',
    );
  }
}
