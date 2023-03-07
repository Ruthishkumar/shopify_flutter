// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewProductsResponse _$ViewProductsResponseFromJson(
        Map<String, dynamic> json) =>
    ViewProductsResponse(
      ProductModel.fromJson(json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewProductsResponseToJson(
        ViewProductsResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      (json['edges'] as List<dynamic>)
          .map((e) => ProductEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };

ProductEdgeModel _$ProductEdgeModelFromJson(Map<String, dynamic> json) =>
    ProductEdgeModel(
      ProductNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductEdgeModelToJson(ProductEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

ProductNode _$ProductNodeFromJson(Map<String, dynamic> json) => ProductNode(
      json['availableForSale'] as bool,
      json['title'] as String,
      json['id'] as String,
      FeatureImage.fromJson(json['featuredImage'] as Map<String, dynamic>),
      ProductVarientModel.fromJson(json['variants'] as Map<String, dynamic>),
      PriceRangeModel.fromJson(json['priceRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductNodeToJson(ProductNode instance) =>
    <String, dynamic>{
      'featuredImage': instance.featuredImage,
      'availableForSale': instance.availableForSale,
      'title': instance.title,
      'id': instance.id,
      'variants': instance.variants,
      'priceRange': instance.priceRange,
    };

ProductVarientModel _$ProductVarientModelFromJson(Map<String, dynamic> json) =>
    ProductVarientModel(
      (json['edges'] as List<dynamic>)
          .map((e) =>
              ProductVarientEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductVarientModelToJson(
        ProductVarientModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };

ProductVarientEdgeModel _$ProductVarientEdgeModelFromJson(
        Map<String, dynamic> json) =>
    ProductVarientEdgeModel(
      ProductVarientNode.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductVarientEdgeModelToJson(
        ProductVarientEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

ProductVarientNode _$ProductVarientNodeFromJson(Map<String, dynamic> json) =>
    ProductVarientNode(
      json['quantityAvailable'] as int,
    );

Map<String, dynamic> _$ProductVarientNodeToJson(ProductVarientNode instance) =>
    <String, dynamic>{
      'quantityAvailable': instance.quantityAvailable,
    };

FeatureImage _$FeatureImageFromJson(Map<String, dynamic> json) => FeatureImage(
      json['url'] as String,
    );

Map<String, dynamic> _$FeatureImageToJson(FeatureImage instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

PriceRangeModel _$PriceRangeModelFromJson(Map<String, dynamic> json) =>
    PriceRangeModel(
      MinvarientPriceModel.fromJson(
          json['minVariantPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceRangeModelToJson(PriceRangeModel instance) =>
    <String, dynamic>{
      'minVariantPrice': instance.minVariantPrice,
    };

MinvarientPriceModel _$MinvarientPriceModelFromJson(
        Map<String, dynamic> json) =>
    MinvarientPriceModel(
      json['amount'] as String,
    );

Map<String, dynamic> _$MinvarientPriceModelToJson(
        MinvarientPriceModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
