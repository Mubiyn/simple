import 'dart:async';

import 'package:simple_app/core/service_locators/app_locator.dart';
import 'package:simple_app/services/app/token_model.dart';
import 'package:simple_app/shared/utilities/resources/disposable_change_notifier.dart';

enum StateStatus { notLoggedIn, loggedIn }

class SimpleUserStateProvider extends DisposableChangeNotifier {
  SimpleUserStateProvider();

  StateStatus _stateStatus = StateStatus.notLoggedIn;
  StateStatus get stateStatus => _stateStatus;
  set stateStatus(StateStatus value) {
    _stateStatus = value;
    Timer(const Duration(milliseconds: 10), () {
      notifyListeners();
    });
  }

  bool _firstTimeUser = true;
  bool get firstTimeUser => _firstTimeUser;
  set firstTimeUser(bool value) {
    _firstTimeUser = value;
    Timer(const Duration(milliseconds: 10), () {
      notifyListeners();
    });
  }

  SimpleUser? _currentUser;
  SimpleUser? get currentUser => _currentUser;
  set currentUser(SimpleUser? value) {
    _currentUser = value;
    Timer(const Duration(milliseconds: 10), () {
      notifyListeners();
    });
  }

  SimpleToken _currentUserToken = SimpleToken(token: null, user: null);
  SimpleToken get currentUserToken => _currentUserToken;
  set currentUserToken(SimpleToken value) {
    _currentUserToken = value;
    simpleuserState.saveTokenWithUser(value.token, value.user);
    Timer(const Duration(milliseconds: 10), () {
      notifyListeners();
    });
  }

  Future<void> initialize() async {
    currentUserToken = simpleuserState.getToken();
    currentUser = currentUserToken.user;
    if (currentUserToken.user != null) {
      firstTimeUser = false;
    }
    if (currentUserToken.token != null && currentUserToken.user != null) {
      stateStatus = StateStatus.loggedIn;
    } else {
      stateStatus = StateStatus.notLoggedIn;
    }
  }

  Future<void> refresh() async {
    initialize();
  }

  Future<void> logout() async {
    await simpleuserState.updateToken(currentUserToken.copyWithOnlyToken(null));
    await refresh();
  }

  @override
  void disposeValues() {}
}
