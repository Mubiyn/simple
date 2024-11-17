import 'dart:convert';
import 'dart:developer';

import 'package:simple_app/service_locators/app_locator.dart';
import 'package:simple_app/services/app/token_model.dart';

abstract class SimpleUserState {
  SimpleToken getToken();
  Future<bool> saveTokenWithUser(String? token, SimpleUser? user);
  Future<bool> deleteToken();
  Future<bool> updateToken(SimpleToken token);
  Future<void> clearCache();
}

class SimpleUserStateImplimentationimentation implements SimpleUserState {
  SimpleUserStateImplimentationimentation();

  @override
  SimpleToken getToken() {
    return _getTokenObjectFromStorage();
  }

  @override
  Future<bool> saveTokenWithUser(String? token, SimpleUser? user) {
    final tokenToSave = SimpleToken(token: token, user: user);
    return sharedPrefs.setString(
        'token', const JsonEncoder().convert(tokenToSave.toJson()));
  }

  SimpleToken _getTokenObjectFromStorage() {
    try {
      final jsonString = sharedPrefs.getString('token');
      if (jsonString == null) {
        return SimpleToken(token: null, user: null);
      }

      final tokenToGet =
          SimpleToken.fromJson(const JsonDecoder().convert(jsonString));
      return tokenToGet;
    } catch (err) {
      log(err.toString());
      return SimpleToken(token: null, user: null);
    }
  }

  @override
  Future<bool> deleteToken() async {
    return await sharedPrefs.remove('token');
  }

  @override
  Future<bool> updateToken(SimpleToken token) async {
    return await sharedPrefs.setString(
        'token', const JsonEncoder().convert(token.toJson()));
  }

  @override
  Future<void> clearCache() async {
    await sharedPrefs.clear();
    await sharedPrefs.reload();
  }
}
