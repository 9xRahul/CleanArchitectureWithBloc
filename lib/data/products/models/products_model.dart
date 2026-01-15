import 'package:clean_architecture_with_bloc/data/products/models/diamensions_model.dart';
import 'package:clean_architecture_with_bloc/data/products/models/meta_model.dart';
import 'package:clean_architecture_with_bloc/data/products/models/review_model.dart';

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionsModel? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewModel>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaModel? meta;
  List<String>? images;
  String? thumbnail;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = (json['price'] as num).toDouble();
    discountPercentage = (json['discountPercentage'] as num).toDouble();
    rating = (json['rating'] as num).toDouble();
    stock = json['stock'];
    tags = json['tags']?.cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions = json['dimensions'] != null
        ? DimensionsModel.fromJson(json['dimensions'])
        : null;

    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];

    if (json['reviews'] != null) {
      reviews = (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList();
    }

    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? MetaModel.fromJson(json['meta']) : null;
    images = json['images']?.cast<String>();
    thumbnail = json['thumbnail'];
  }
}
