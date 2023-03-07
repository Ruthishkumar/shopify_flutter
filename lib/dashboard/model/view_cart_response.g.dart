// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewCartResponse _$ViewCartResponseFromJson(Map<String, dynamic> json) =>
    ViewCartResponse(
      ViewCartModel.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewCartResponseToJson(ViewCartResponse instance) =>
    <String, dynamic>{
      'cart': instance.cart,
    };

ViewCartModel _$ViewCartModelFromJson(Map<String, dynamic> json) =>
    ViewCartModel(
      CartLineModel.fromJson(json['lines'] as Map<String, dynamic>),
      json['id'] as String,
      json['totalQuantity'] as int,
      CartCostModel.fromJson(json['cost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewCartModelToJson(ViewCartModel instance) =>
    <String, dynamic>{
      'lines': instance.lines,
      'id': instance.id,
      'totalQuantity': instance.totalQuantity,
      'cost': instance.cost,
    };

CartLineModel _$CartLineModelFromJson(Map<String, dynamic> json) =>
    CartLineModel(
      (json['edges'] as List<dynamic>)
          .map((e) => CartEdgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartLineModelToJson(CartLineModel instance) =>
    <String, dynamic>{
      'edges': instance.edges,
    };

CartEdgeModel _$CartEdgeModelFromJson(Map<String, dynamic> json) =>
    CartEdgeModel(
      CartNodeModel.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartEdgeModelToJson(CartEdgeModel instance) =>
    <String, dynamic>{
      'node': instance.node,
    };

CartNodeModel _$CartNodeModelFromJson(Map<String, dynamic> json) =>
    CartNodeModel(
      CartMerchandizeModel.fromJson(
          json['merchandise'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartNodeModelToJson(CartNodeModel instance) =>
    <String, dynamic>{
      'merchandise': instance.merchandise,
    };

CartMerchandizeModel _$CartMerchandizeModelFromJson(
        Map<String, dynamic> json) =>
    CartMerchandizeModel(
      (json['selectedOptions'] as List<dynamic>)
          .map((e) => CartSelectionOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      CartImageModel.fromJson(json['image'] as Map<String, dynamic>),
      json['title'] as String,
      ProductTypeModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartMerchandizeModelToJson(
        CartMerchandizeModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'selectedOptions': instance.selectedOptions,
      'image': instance.image,
      'title': instance.title,
    };

ProductTypeModel _$ProductTypeModelFromJson(Map<String, dynamic> json) =>
    ProductTypeModel(
      json['productType'] as String,
    );

Map<String, dynamic> _$ProductTypeModelToJson(ProductTypeModel instance) =>
    <String, dynamic>{
      'productType': instance.productType,
    };

CartSelectionOptions _$CartSelectionOptionsFromJson(
        Map<String, dynamic> json) =>
    CartSelectionOptions(
      json['name'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$CartSelectionOptionsToJson(
        CartSelectionOptions instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

CartImageModel _$CartImageModelFromJson(Map<String, dynamic> json) =>
    CartImageModel(
      json['url'] as String,
    );

Map<String, dynamic> _$CartImageModelToJson(CartImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

CartCostModel _$CartCostModelFromJson(Map<String, dynamic> json) =>
    CartCostModel(
      SubTotalModel.fromJson(
          json['checkoutChargeAmount'] as Map<String, dynamic>),
      TaxTotalModel.fromJson(json['totalTaxAmount'] as Map<String, dynamic>),
      TotalAmountModel.fromJson(json['totalAmount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartCostModelToJson(CartCostModel instance) =>
    <String, dynamic>{
      'checkoutChargeAmount': instance.checkoutChargeAmount,
      'totalTaxAmount': instance.totalTaxAmount,
      'totalAmount': instance.totalAmount,
    };

SubTotalModel _$SubTotalModelFromJson(Map<String, dynamic> json) =>
    SubTotalModel(
      json['amount'] as String,
    );

Map<String, dynamic> _$SubTotalModelToJson(SubTotalModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };

TaxTotalModel _$TaxTotalModelFromJson(Map<String, dynamic> json) =>
    TaxTotalModel(
      json['amount'] as String,
    );

Map<String, dynamic> _$TaxTotalModelToJson(TaxTotalModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };

TotalAmountModel _$TotalAmountModelFromJson(Map<String, dynamic> json) =>
    TotalAmountModel(
      json['amount'] as String,
    );

Map<String, dynamic> _$TotalAmountModelToJson(TotalAmountModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
