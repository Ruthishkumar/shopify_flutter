import 'package:flutter/material.dart';
import 'package:shopify_flutter/dashboard/model/view_collection_response.dart';
import 'package:shopify_flutter/dashboard/product_service/product_service.dart';

class AttributeProvider extends ChangeNotifier {
  String productId = "";
  String cartId = "";
  String checkOutId = "";
  Map<String, dynamic> saveUserAddress = {};
  String webUrl = "";
  String getProductId = "";
  List<CollectionEdgeModel> providerCollection = [];

  String productChangeStatus = "";
  bool loading = false;

  void addProductId(String value) {
    productId = value;
    notifyListeners();
  }

  void addCartId(String value) {
    cartId = value;
    notifyListeners();
  }

  void addCheckOutId(String value) {
    checkOutId = value;
    notifyListeners();
  }

  void saveAddressSummary(Map<String, dynamic> value) {
    saveUserAddress = value;
    notifyListeners();
  }

  void redirectPaymentUrl(String value) {
    webUrl = value;
    notifyListeners();
  }

  void changeProductListing({required String value}) async {
    getProductId = value;
    providerCollection =
        await ProductService().getCollections(variables: {"first": 10});
    notifyListeners();
  }
}
