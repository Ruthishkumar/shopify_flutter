import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const shopifyUrl =
    "https://deepflutterdev.myshopify.com/api/2022-10/graphql.json";

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(shopifyUrl, defaultHeaders: {
    "Content-Type": "application/json",
    "X-Shopify-Storefront-Access-Token": "520acde6e4ad66e82c9ddc0ec37eed41",
  });

  static AuthLink authLink = AuthLink(getToken: () async {});

  static Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(link: link, cache: GraphQLCache()),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    );
  }
}
