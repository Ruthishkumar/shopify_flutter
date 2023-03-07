import 'package:json_annotation/json_annotation.dart';
part 'view_products_response.g.dart';

@JsonSerializable()
class ViewProductsResponse {
  final ProductModel products;

  ViewProductsResponse(this.products);

  factory ViewProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ViewProductsResponseToJson(this);
}

@JsonSerializable()
class ProductModel {
  List<ProductEdgeModel> edges;

  ProductModel(this.edges);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductEdgeModel {
  final ProductNode node;

  ProductEdgeModel(this.node);

  factory ProductEdgeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductEdgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductEdgeModelToJson(this);
}

@JsonSerializable()
class ProductNode {
  final FeatureImage featuredImage;
  final bool availableForSale;
  final String title;
  final String id;
  final ProductVarientModel variants;
  final PriceRangeModel priceRange;

  ProductNode(this.availableForSale, this.title, this.id, this.featuredImage,
      this.variants, this.priceRange);

  factory ProductNode.fromJson(Map<String, dynamic> json) =>
      _$ProductNodeFromJson(json);
  Map<String, dynamic> toJson() => _$ProductNodeToJson(this);
}

@JsonSerializable()
class ProductVarientModel {
  final List<ProductVarientEdgeModel> edges;

  ProductVarientModel(this.edges);

  factory ProductVarientModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVarientModelToJson(this);
}

@JsonSerializable()
class ProductVarientEdgeModel {
  final ProductVarientNode node;

  ProductVarientEdgeModel(this.node);

  factory ProductVarientEdgeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientEdgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVarientEdgeModelToJson(this);
}

@JsonSerializable()
class ProductVarientNode {
  final int quantityAvailable;

  ProductVarientNode(this.quantityAvailable);

  factory ProductVarientNode.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientNodeFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVarientNodeToJson(this);
}

@JsonSerializable()
class FeatureImage {
  String url;

  FeatureImage(this.url);

  factory FeatureImage.fromJson(Map<String, dynamic> json) =>
      _$FeatureImageFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureImageToJson(this);
}

@JsonSerializable()
class PriceRangeModel {
  final MinvarientPriceModel minVariantPrice;

  PriceRangeModel(this.minVariantPrice);

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceRangeModelToJson(this);
}

@JsonSerializable()
class MinvarientPriceModel {
  String amount;

  MinvarientPriceModel(this.amount);

  factory MinvarientPriceModel.fromJson(Map<String, dynamic> json) =>
      _$MinvarientPriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$MinvarientPriceModelToJson(this);
}
