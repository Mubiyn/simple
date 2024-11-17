import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_app/service_locators/simple_locator.dart';
import 'package:simple_app/services/app/token_model.dart';
import 'package:simple_app/shared/utils/resources/disposable_change_notifier.dart';

class SimpleViewModel extends DisposableChangeNotifier {
  SimpleViewModel();

  Future<bool> login() async {
    isLoading = true;
    final result = await simpleService.getGoogleResponse();
    isLoading = false;
    return result.fold((l) async {
      errorOrSuccessMessage = l.message;
      return false;
    }, (r) async {
      simpleStateProvider.currentUserToken = SimpleToken(
          token: 'token',
          user: SimpleUser(
            userId: '1',
            name: nameController.text,
          ));
      await simpleService.getGoogleResponse();
      return true;
    });
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    Timer(const Duration(milliseconds: 10), () {
      notifyListeners();
    });
  }

  String errorOrSuccessMessage = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void disposeValues() {
    isLoading = false;
    nameController.clear();
    passwordController.clear();
    emailController.clear();
    errorOrSuccessMessage = '';
  }
}
