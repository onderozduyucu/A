import 'package:fluttermvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:fluttermvvmtemplate/view/login/model/user.dart';


class AuthenticationManager extends LocaleManager {
  AuthenticationManager() {
    fetchUserLogin();
  }

  bool isLogin = false;
  bool isFirst = false;
  User? model;

  Future<void> fetchUserLogin() async {
    isFirst = getFirstApp();
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}
