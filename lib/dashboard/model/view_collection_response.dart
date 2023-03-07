import 'package:json_annotation/json_annotation.dart';
part 'view_collection_response.g.dart';

@JsonSerializable()
class ViewCollectionResponse {
  final ViewCollectionModel collections;

  ViewCollectionResponse(this.collections);

  factory ViewCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewCollectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ViewCollectionResponseToJson(this);
}

@JsonSerializable()
class ViewCollectionModel {
  final List<CollectionEdgeModel> edges;

  ViewCollectionModel(this.edges);

  factory ViewCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$ViewCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ViewCollectionModelToJson(this);
}

@JsonSerializable()
class CollectionEdgeModel {
  final CollectionNodeModel node;

  CollectionEdgeModel(this.node);

  factory CollectionEdgeModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionEdgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionEdgeModelToJson(this);
}

@JsonSerializable()
class CollectionNodeModel {
  final String title;
  final String id;
  final ProductCollectionModel products;

  CollectionNodeModel(this.title, this.products, this.id);

  factory CollectionNodeModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionNodeModelToJson(this);
}

@JsonSerializable()
class ProductCollectionModel {
  final List<ProductionCollectionEdgeModel> edges;

  ProductCollectionModel(this.edges);

  factory ProductCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCollectionModelToJson(this);
}

@JsonSerializable()
class ProductionCollectionEdgeModel {
  final ProductCollectionNodeModel node;

  ProductionCollectionEdgeModel(this.node);

  factory ProductionCollectionEdgeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCollectionEdgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCollectionEdgeModelToJson(this);
}

@JsonSerializable()
class ProductCollectionNodeModel {
  final ProductionFeaturedImageModel featuredImage;
  final String id;
  final String title;
  final PriceRangeModel priceRange;

  ProductCollectionNodeModel(
      this.featuredImage, this.id, this.title, this.priceRange);

  factory ProductCollectionNodeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCollectionNodeModelToJson(this);
}

@JsonSerializable()
class ProductionFeaturedImageModel {
  final String url;

  ProductionFeaturedImageModel(this.url);

  factory ProductionFeaturedImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionFeaturedImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionFeaturedImageModelToJson(this);
}

@JsonSerializable()
class PriceRangeModel {
  final MinPriceRangeModel minVariantPrice;

  PriceRangeModel(this.minVariantPrice);

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceRangeModelToJson(this);
}

@JsonSerializable()
class MinPriceRangeModel {
  final String amount;

  MinPriceRangeModel(this.amount);

  factory MinPriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$MinPriceRangeModelFromJson(json);
  Map<String, dynamic> toJson() => _$MinPriceRangeModelToJson(this);
}
