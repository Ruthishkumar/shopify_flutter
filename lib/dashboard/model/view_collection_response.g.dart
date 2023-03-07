// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewCollectionResponse _$ViewCollectionResponseFromJson(
        Map<String, dynamic> json) =>
    ViewCollectionResponse(
      ViewCollectionModel.fromJson(json['collections'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewCollectionResponseToJson(
        ViewCollectionResponse instance) =>
    <String, dynamic>{
      'collections': instance.collections,
    };

ViewCollectionModel _$ViewCollectionModelFromJson(Map<String, dynamic> json) =>
    ViewCollectionModel(
      (json['edges'] as List<dynamic>)
          .map((e) => CollectionEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewCollectionModelToJson(
        ViewCollectionModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };

CollectionEdgeModel _$CollectionEdgeModelFromJson(Map<String, dynamic> json) =>
    CollectionEdgeModel(
      CollectionNodeModel.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionEdgeModelToJson(
        CollectionEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

CollectionNodeModel _$CollectionNodeModelFromJson(Map<String, dynamic> json) =>
    CollectionNodeModel(
      json['title'] as String,
      ProductCollectionModel.fromJson(json['products'] as Map<String, dynamic>),
      json['id'] as String,
    );

Map<String, dynamic> _$CollectionNodeModelToJson(
        CollectionNodeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'products': instance.products,
    };

ProductCollectionModel _$ProductCollectionModelFromJson(
        Map<String, dynamic> json) =>
    ProductCollectionModel(
      (json['edges'] as List<dynamic>)
          .map((e) =>
              ProductionCollectionEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCollectionModelToJson(
        ProductCollectionModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };

ProductionCollectionEdgeModel _$ProductionCollectionEdgeModelFromJson(
        Map<String, dynamic> json) =>
    ProductionCollectionEdgeModel(
      ProductCollectionNodeModel.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductionCollectionEdgeModelToJson(
        ProductionCollectionEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

ProductCollectionNodeModel _$ProductCollectionNodeModelFromJson(
        Map<String, dynamic> json) =>
    ProductCollectionNodeModel(
      ProductionFeaturedImageModel.fromJson(
          json['featuredImage'] as Map<String, dynamic>),
      json['id'] as String,
      json['title'] as String,
      PriceRangeModel.fromJson(json['priceRange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductCollectionNodeModelToJson(
        ProductCollectionNodeModel instance) =>
    <String, dynamic>{
      'featuredImage': instance.featuredImage,
      'id': instance.id,
      'title': instance.title,
      'priceRange': instance.priceRange,
    };

ProductionFeaturedImageModel _$ProductionFeaturedImageModelFromJson(
        Map<String, dynamic> json) =>
    ProductionFeaturedImageModel(
      json['url'] as String,
    );

Map<String, dynamic> _$ProductionFeaturedImageModelToJson(
        ProductionFeaturedImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

PriceRangeModel _$PriceRangeModelFromJson(Map<String, dynamic> json) =>
    PriceRangeModel(
      MinPriceRangeModel.fromJson(
          json['minVariantPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceRangeModelToJson(PriceRangeModel instance) =>
    <String, dynamic>{
      'minVariantPrice': instance.minVariantPrice,
    };

MinPriceRangeModel _$MinPriceRangeModelFromJson(Map<String, dynamic> json) =>
    MinPriceRangeModel(
      json['amount'] as String,
    );

Map<String, dynamic> _$MinPriceRangeModelToJson(MinPriceRangeModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
