import 'package:login_signup/database_helper/database_selper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = AbstractAuthStore with _$AuthStore;

abstract class AbstractAuthStore with Store {
  final DatabaseHelper databaseHelper;

  @observable
  bool isLogin = true;

  @observable
  bool isLoading = true;

  @observable
  String? errorMessage;

  @observable
  bool isLoggedIn = false;

  @observable
  String? loggedInUsername;

  AbstractAuthStore({required this.databaseHelper}) {
    _loadUser();
  }

  @action
  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString('username');

    if (username != null) {
      loggedInUsername = username;
      isLoggedIn = true;
    }
    isLoading = false;
  }

  @action
  Future<bool> register(String username, String email, String password) async {
    if (username.isEmpty || email.isEmpty || password.length < 6) {
      errorMessage = 'Invalid input';
      return false;
    }
    await databaseHelper.registerUser(username, email, password);

    await _saveUser(username);
    return true;
  }

  @action
  Future<bool> login(String username, String password) async {
    var user = await databaseHelper.loginUser(username, password);
    print('/////user $user ');
    if (user != null) {
      await _saveUser(username);
      return true;
    } else {
      errorMessage = 'Invalid username or password';
      return false;
    }
  }

  Future<void> _saveUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    loggedInUsername = username;
    isLoggedIn = true;
  }

  @action
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    loggedInUsername = null;
    isLoggedIn = false;
  }

  @action
  void removeErrorMessage() {
    errorMessage = '';
  }
}
