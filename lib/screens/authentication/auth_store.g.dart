// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AbstractAuthStore, Store {
  late final _$isLoginAtom =
      Atom(name: 'AbstractAuthStore.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AbstractAuthStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'AbstractAuthStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: 'AbstractAuthStore.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$loggedInUsernameAtom =
      Atom(name: 'AbstractAuthStore.loggedInUsername', context: context);

  @override
  String? get loggedInUsername {
    _$loggedInUsernameAtom.reportRead();
    return super.loggedInUsername;
  }

  @override
  set loggedInUsername(String? value) {
    _$loggedInUsernameAtom.reportWrite(value, super.loggedInUsername, () {
      super.loggedInUsername = value;
    });
  }

  late final _$_loadUserAsyncAction =
      AsyncAction('AbstractAuthStore._loadUser', context: context);

  @override
  Future<void> _loadUser() {
    return _$_loadUserAsyncAction.run(() => super._loadUser());
  }

  late final _$registerAsyncAction =
      AsyncAction('AbstractAuthStore.register', context: context);

  @override
  Future<bool> register(String username, String email, String password) {
    return _$registerAsyncAction
        .run(() => super.register(username, email, password));
  }

  late final _$loginAsyncAction =
      AsyncAction('AbstractAuthStore.login', context: context);

  @override
  Future<bool> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  late final _$logoutAsyncAction =
      AsyncAction('AbstractAuthStore.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$AbstractAuthStoreActionController =
      ActionController(name: 'AbstractAuthStore', context: context);

  @override
  void removeErrorMessage() {
    final _$actionInfo = _$AbstractAuthStoreActionController.startAction(
        name: 'AbstractAuthStore.removeErrorMessage');
    try {
      return super.removeErrorMessage();
    } finally {
      _$AbstractAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isLoggedIn: ${isLoggedIn},
loggedInUsername: ${loggedInUsername}
    ''';
  }
}
