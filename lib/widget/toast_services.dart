import 'package:flutter/material.dart';

class ToastService {
  static final ToastService _singleton = ToastService._internal();

  final GlobalKey<NavigatorState> globalKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  factory ToastService() {
    return _singleton;
  }
  ToastService._internal();

  showError(String? msg) {
    final snackBar = SnackBar(
      content: Text(
        msg ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  showSuccess(String? msg) {
    final snackBar = SnackBar(
      content: Text(
        msg ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
  }

  showInfo(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: const Color(0xFF29b6f6),
    );
    ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
  }
}
