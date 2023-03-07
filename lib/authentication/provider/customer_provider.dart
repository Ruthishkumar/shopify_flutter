import 'package:flutter/cupertino.dart';

class CustomerProvider extends ChangeNotifier {
  String accessToken = "";

  void getAccessToken(String value) {
    accessToken = value;
    notifyListeners();
  }
}
