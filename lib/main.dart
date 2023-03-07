import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shopify_flutter/api_client/graphql_confiq.dart';
import 'package:shopify_flutter/api_client/mutation/mutation_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify_flutter/authentication/provider/customer_provider.dart';
import 'package:shopify_flutter/authentication/services/storage_services.dart';
import 'package:shopify_flutter/authentication/view/log_in_page.dart';
import 'package:shopify_flutter/dashboard/view/dash_board_page.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';

String accessToken = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  accessToken = await StorageServices().getJwtToken();
  log(accessToken.toString());
  log('ShopifyAccessToken');
  runApp(GraphQLProvider(
      client: GraphQLConfiguration().client,
      child: MultiProvider(providers: [
        ChangeNotifierProvider<MutationProvider>(
            create: (_) => MutationProvider()),
        ChangeNotifierProvider<CustomerProvider>(
            create: (_) => CustomerProvider()),
        ChangeNotifierProvider<AttributeProvider>(
            create: (_) => AttributeProvider()),
      ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 805),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: accessToken == '' ? '/logInPage' : '/dashboardPage',
            routes: {
              '/logInPage': (context) => const LoginPage(),
              '/dashboardPage': (context) => const DashBoardPage(),
            },
          );
        });
  }
}
