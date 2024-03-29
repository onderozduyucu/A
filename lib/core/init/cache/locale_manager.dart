import 'package:fluttermvvmtemplate/core/constants/enums/locale_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manager_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  LocaleManager();
  
  static SharedPreferences? preferences;
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPrefences() {
    if (preferences == null) {
      throw SharedNotInitializeException();
    }
  }

  Future<void> saveFirstApp() async {
    _checkPrefences();
    await preferences?.clear();
    await setBoolValue(PreferencesKeys.IS_FIRST_APP, value: true);
  }

  Future<void> saveToken(PreferencesKeys key, String? value) async {
    _checkPrefences();
    await preferences?.setString(key.toString(), value ?? '');
  }

  Future<void> setBoolValue(PreferencesKeys key, {required bool value}) async {
    _checkPrefences();
    await preferences?.setBool(key.toString(), value);
  }

  Future<String?> getToken() async {
    _checkPrefences();
    return preferences?.getString(PreferencesKeys.TOKEN.toString()) ?? '';
  }

  bool getFirstApp() => preferences?.getBool(PreferencesKeys.IS_FIRST_APP.toString()) ?? false;
}
