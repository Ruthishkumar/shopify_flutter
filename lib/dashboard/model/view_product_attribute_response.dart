import 'package:json_annotation/json_annotation.dart';
part 'view_product_attribute_response.g.dart';

@JsonSerializable()
class ViewProductAttributeResponse {
  final ViewProductAttributeModel product;

  ViewProductAttributeResponse(this.product);

  factory ViewProductAttributeResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewProductAttributeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ViewProductAttributeResponseToJson(this);
}

@JsonSerializable()
class ViewProductAttributeModel {
  final String productType;
  final FeaturedImageModel featuredImage;
  final String title;
  final ProductVarientModel variants;
  final List<ProductOptionsListModel> options;

  ViewProductAttributeModel(this.variants, this.productType, this.featuredImage,
      this.options, this.title);

  factory ViewProductAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$ViewProductAttributeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ViewProductAttributeModelToJson(this);
}

@JsonSerializable()
class ProductOptionsListModel {
  final String id;
  @JsonKey(defaultValue: '')
  final String? name;
  final List<String> values;

  ProductOptionsListModel(this.name, this.values, this.id);

  factory ProductOptionsListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOptionsListModelToJson(this);
}

@JsonSerializable()
class ProductVarientModel {
  final List<ProductEdgeModel> edges;

  ProductVarientModel(this.edges);

  factory ProductVarientModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVarientModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVarientModelToJson(this);
}

@JsonSerializable()
class ProductEdgeModel {
  final ProductNodeModel node;

  ProductEdgeModel(this.node);

  factory ProductEdgeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductEdgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductEdgeModelToJson(this);
}

@JsonSerializable()
class FeaturedImageModel {
  String url;

  FeaturedImageModel(this.url);

  factory FeaturedImageModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturedImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedImageModelToJson(this);
}

@JsonSerializable()
class ProductNodeModel {
  final String title;
  final String sku;
  final String id;
  final bool availableForSale;
  final ProductPrice price;
  final List<ProductOptions> selectedOptions;
  final int quantityAvailable;

  ProductNodeModel(this.title, this.sku, this.price, this.selectedOptions,
      this.id, this.availableForSale, this.quantityAvailable);

  factory ProductNodeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductNodeModelToJson(this);
}

@JsonSerializable()
class ProductPrice {
  String amount;

  ProductPrice(this.amount);

  factory ProductPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceFromJson(json);
  Map<String, dynamic> toJson() => _$ProductPriceToJson(this);
}

@JsonSerializable()
class ProductOptions {
  String name;
  String value;

  ProductOptions(this.name, this.value);

  factory ProductOptions.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOptionsToJson(this);
}
