import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/api_client/graphql_confiq.dart';
import 'package:shopify_flutter/api_client/query/query_api.dart';
import 'package:shopify_flutter/dashboard/model/view_cart_response.dart';
import 'package:shopify_flutter/dashboard/model/view_product_attribute_response.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
AllQueries allQueries = AllQueries();

class AttributeService {
  Future<ViewProductAttributeModel> getProductVarient(
      {required Map<String, dynamic> variables}) async {
    try {
      GraphQLClient client = graphQLConfiguration.clientToQuery();
      QueryResult result = await client.query(QueryOptions(
          document: gql(allQueries.productsAttributes), variables: variables));
      final getProductAttribute =
          ViewProductAttributeResponse.fromJson(result.data!).product;
      return getProductAttribute;
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      rethrow;
    }
  }

  Future<ViewCartModel> getCartData(
      {required Map<String, dynamic> variables}) async {
    try {
      GraphQLClient client = graphQLConfiguration.clientToQuery();
      QueryResult result = await client.query(QueryOptions(
          document: gql(allQueries.getCart), variables: variables));
      final getCart = ViewCartResponse.fromJson(result.data!).cart;
      log(getCart.id);
      log('serviceCartId');
      return getCart;
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      rethrow;
    }
  }
}
