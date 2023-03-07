import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_flutter/product/attribute_provider/attribute_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaymentPage extends StatefulWidget {
  const WebViewPaymentPage({Key? key}) : super(key: key);

  @override
  State<WebViewPaymentPage> createState() => _WebViewPaymentPageState();
}

class _WebViewPaymentPageState extends State<WebViewPaymentPage> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: WebView(
        initialUrl:
            Provider.of<AttributeProvider>(context, listen: false).webUrl,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (WebViewController webviewcontroller) {
          controller.complete(webviewcontroller);
        },
      ),
    );
  }
}
