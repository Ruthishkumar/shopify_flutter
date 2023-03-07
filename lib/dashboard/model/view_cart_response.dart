import 'package:json_annotation/json_annotation.dart';
part 'view_cart_response.g.dart';

@JsonSerializable()
class ViewCartResponse {
  final ViewCartModel cart;

  ViewCartResponse(this.cart);

  factory ViewCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ViewCartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ViewCartResponseToJson(this);
}

@JsonSerializable()
class ViewCartModel {
  final CartLineModel lines;
  final String id;
  final int totalQuantity;
  final CartCostModel cost;

  ViewCartModel(this.lines, this.id, this.totalQuantity, this.cost);

  factory ViewCartModel.fromJson(Map<String, dynamic> json) =>
      _$ViewCartModelFromJson(json);
  Map<String, dynamic> toJson() => _$ViewCartModelToJson(this);
}

@JsonSerializable()
class CartLineModel {
  final List<CartEdgeModel> edges;

  CartLineModel(this.edges);

  factory CartLineModel.fromJson(Map<String, dynamic> json) =>
      _$CartLineModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartLineModelToJson(this);
}

@JsonSerializable()
class CartEdgeModel {
  final CartNodeModel node;

  CartEdgeModel(this.node);

  factory CartEdgeModel.fromJson(Map<String, dynamic> json) =>
      _$CartEdgeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartEdgeModelToJson(this);
}

@JsonSerializable()
class CartNodeModel {
  final CartMerchandizeModel merchandise;

  CartNodeModel(this.merchandise);

  factory CartNodeModel.fromJson(Map<String, dynamic> json) =>
      _$CartNodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartNodeModelToJson(this);
}

@JsonSerializable()
class CartMerchandizeModel {
  final ProductTypeModel product;
  final List<CartSelectionOptions> selectedOptions;
  final CartImageModel image;
  final String title;

  CartMerchandizeModel(
      this.selectedOptions, this.image, this.title, this.product);

  factory CartMerchandizeModel.fromJson(Map<String, dynamic> json) =>
      _$CartMerchandizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartMerchandizeModelToJson(this);
}

@JsonSerializable()
class ProductTypeModel {
  final String productType;

  ProductTypeModel(this.productType);

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductTypeModelToJson(this);
}

@JsonSerializable()
class CartSelectionOptions {
  final String name;
  final String value;

  CartSelectionOptions(this.name, this.value);

  factory CartSelectionOptions.fromJson(Map<String, dynamic> json) =>
      _$CartSelectionOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$CartSelectionOptionsToJson(this);
}

@JsonSerializable()
class CartImageModel {
  final String url;

  CartImageModel(this.url);

  factory CartImageModel.fromJson(Map<String, dynamic> json) =>
      _$CartImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartImageModelToJson(this);
}

@JsonSerializable()
class CartCostModel {
  final SubTotalModel checkoutChargeAmount;
  final TaxTotalModel totalTaxAmount;
  final TotalAmountModel totalAmount;

  CartCostModel(
      this.checkoutChargeAmount, this.totalTaxAmount, this.totalAmount);

  factory CartCostModel.fromJson(Map<String, dynamic> json) =>
      _$CartCostModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartCostModelToJson(this);
}

@JsonSerializable()
class SubTotalModel {
  final String amount;

  SubTotalModel(this.amount);

  factory SubTotalModel.fromJson(Map<String, dynamic> json) =>
      _$SubTotalModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubTotalModelToJson(this);
}

@JsonSerializable()
class TaxTotalModel {
  final String amount;

  TaxTotalModel(this.amount);

  factory TaxTotalModel.fromJson(Map<String, dynamic> json) =>
      _$TaxTotalModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaxTotalModelToJson(this);
}

@JsonSerializable()
class TotalAmountModel {
  final String amount;

  TotalAmountModel(this.amount);

  factory TotalAmountModel.fromJson(Map<String, dynamic> json) =>
      _$TotalAmountModelFromJson(json);
  Map<String, dynamic> toJson() => _$TotalAmountModelToJson(this);
}
