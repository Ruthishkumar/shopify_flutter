import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  static final StorageServices _singleton = StorageServices._internal();

  factory StorageServices() {
    return _singleton;
  }

  StorageServices._internal();

  Future<void> setJwtToken(String? jwtToken) async {
    if (jwtToken != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', jwtToken);
    }
  }

  Future<String> getJwtToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken') ?? '';
  }
}
