import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/api_client/graphql_confiq.dart';
import 'package:shopify_flutter/api_client/query/query_api.dart';
import 'package:shopify_flutter/dashboard/model/view_collection_response.dart';
import 'package:shopify_flutter/dashboard/model/view_products_response.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
AllQueries allQueries = AllQueries();

class ProductService {
  Future<List<ProductEdgeModel>> getProducts(
      {required Map<String, dynamic> variables}) async {
    try {
      GraphQLClient client = graphQLConfiguration.clientToQuery();

      QueryResult result = await client.query(QueryOptions(
          document: gql(allQueries.getProducts), variables: variables));
      final getProductList =
          ViewProductsResponse.fromJson(result.data!).products.edges;
      return getProductList;
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
      return [];
    }
  }

  Future<List<CollectionEdgeModel>> getCollections(
      {required Map<String, dynamic> variables}) async {
    try {
      GraphQLClient client = graphQLConfiguration.clientToQuery();
      QueryResult result = await client.query(QueryOptions(
          document: gql(allQueries.getCollection), variables: variables));
      final getCollectionList =
          ViewCollectionResponse.fromJson(result.data!).collections.edges;
      return getCollectionList;
    } catch (e, stack) {
      log(e.toString());
      log(stack.toString());
    }
    return [];
  }
}
