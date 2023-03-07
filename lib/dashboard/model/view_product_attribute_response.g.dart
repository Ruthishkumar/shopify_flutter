// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_product_attribute_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewProductAttributeResponse _$ViewProductAttributeResponseFromJson(
        Map<String, dynamic> json) =>
    ViewProductAttributeResponse(
      ViewProductAttributeModel.fromJson(
          json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewProductAttributeResponseToJson(
        ViewProductAttributeResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
    };

ViewProductAttributeModel _$ViewProductAttributeModelFromJson(
        Map<String, dynamic> json) =>
    ViewProductAttributeModel(
      ProductVarientModel.fromJson(json['variants'] as Map<String, dynamic>),
      json['productType'] as String,
      FeaturedImageModel.fromJson(
          json['featuredImage'] as Map<String, dynamic>),
      (json['options'] as List<dynamic>)
          .map((e) =>
              ProductOptionsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['title'] as String,
    );

Map<String, dynamic> _$ViewProductAttributeModelToJson(
        ViewProductAttributeModel instance) =>
    <String, dynamic>{
      'productType': instance.productType,
      'featuredImage': instance.featuredImage,
      'title': instance.title,
      'variants': instance.variants,
      'options': instance.options,
    };

ProductOptionsListModel _$ProductOptionsListModelFromJson(
        Map<String, dynamic> json) =>
    ProductOptionsListModel(
      json['name'] as String? ?? '',
      (json['values'] as List<dynamic>).map((e) => e as String).toList(),
      json['id'] as String,
    );

Map<String, dynamic> _$ProductOptionsListModelToJson(
        ProductOptionsListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'values': instance.values,
    };

ProductVarientModel _$ProductVarientModelFromJson(Map<String, dynamic> json) =>
    ProductVarientModel(
      (json['edges'] as List<dynamic>)
          .map((e) => ProductEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductVarientModelToJson(
        ProductVarientModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };

ProductEdgeModel _$ProductEdgeModelFromJson(Map<String, dynamic> json) =>
    ProductEdgeModel(
      ProductNodeModel.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductEdgeModelToJson(ProductEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

FeaturedImageModel _$FeaturedImageModelFromJson(Map<String, dynamic> json) =>
    FeaturedImageModel(
      json['url'] as String,
    );

Map<String, dynamic> _$FeaturedImageModelToJson(FeaturedImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

ProductNodeModel _$ProductNodeModelFromJson(Map<String, dynamic> json) =>
    ProductNodeModel(
      json['title'] as String,
      json['sku'] as String,
      ProductPrice.fromJson(json['price'] as Map<String, dynamic>),
      (json['selectedOptions'] as List<dynamic>)
          .map((e) => ProductOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as String,
      json['availableForSale'] as bool,
      json['quantityAvailable'] as int,
    );

Map<String, dynamic> _$ProductNodeModelToJson(ProductNodeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sku': instance.sku,
      'id': instance.id,
      'availableForSale': instance.availableForSale,
      'price': instance.price,
      'selectedOptions': instance.selectedOptions,
      'quantityAvailable': instance.quantityAvailable,
    };

ProductPrice _$ProductPriceFromJson(Map<String, dynamic> json) => ProductPrice(
      json['amount'] as String,
    );

Map<String, dynamic> _$ProductPriceToJson(ProductPrice instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };

ProductOptions _$ProductOptionsFromJson(Map<String, dynamic> json) =>
    ProductOptions(
      json['name'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$ProductOptionsToJson(ProductOptions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
