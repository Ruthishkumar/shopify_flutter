import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/api_client/graphql_confiq.dart';
import 'package:shopify_flutter/widget/toast_services.dart';

class MutationProvider extends ChangeNotifier {
  var data;

  Future mutationResponse(
      Map<String, dynamic> variables, String mutation) async {
    try {
      await GraphQLConfiguration().clientToQuery().mutate(
            MutationOptions(
                document: gql(mutation),
                variables: variables,
                onCompleted: (result) {
                  log('$data');
                  data = result;
                },
                onError: (e) {
                  log(e.toString());
                  // log(stack.toString());
                  ToastService().showError(e?.graphqlErrors[0].message);
                }),
          );
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
