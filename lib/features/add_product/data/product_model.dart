import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/data/review_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final int sellingCount;

  ProductModel({
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.isOrganic,
    required this.reviews,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
      name: productEntity.name,
      code: productEntity.code,
      description: productEntity.description,
      price: productEntity.price,
      image: productEntity.image,
      expirationsMonths: productEntity.expirationsMonths,
      numberOfCalories: productEntity.numberOfCalories,
      unitAmount: productEntity.unitAmount,
      isFeatured: productEntity.isFeatured,
      imageUrl: productEntity.imageUrl,
      isOrganic: productEntity.isOrganic,
      reviews: productEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'sellingCount': sellingCount,
    };
  }
}
