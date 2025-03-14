import 'package:flutter_test/flutter_test.dart';
import 'package:login_signup/database_helper/database_selper.dart';
import 'package:login_signup/screens/authentication/auth_store.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockDatabaseHelper extends Mock implements DatabaseHelperImpl {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late AuthStore authStore;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();

    SharedPreferences.setMockInitialValues({});

    authStore = AuthStore(databaseHelper: mockDatabaseHelper);
  });

  /// I dont get why its not work
  group('AuthStore Tests', () {
    test('Successful registration should return true', () async {
      when(
        mockDatabaseHelper.registerUser(
          "testUser",
          "test@email.com",
          "password123",
        ),
      ).thenAnswer((_) async => 1);

      bool result = await authStore.register(
        "testUser",
        "test@email.com",
        "password123",
      );

      expect(result, true);
      expect(authStore.errorMessage, isNull);
    });

    test('Register with invalid input should return false', () async {
      bool result = await authStore.register("", "invalid", "123");

      expect(result, false);
      expect(authStore.errorMessage?.isNotEmpty, true);
    });

    test('Successful login should return true', () async {
      when(mockDatabaseHelper.loginUser("testUser", "password123")).thenAnswer(
        (_) async => {
          'id': 0,
          'username': 'testUser',
          'email': 'test@email.com',
          'password': 'password123',
        },
      );

      bool result = await authStore.login("testUser", "password123");

      expect(result, true);
      expect(authStore.isLoggedIn, true);
      expect(authStore.loggedInUsername, "testUser");
    });

    test('Login with incorrect credentials should return false', () async {
      when(
        mockDatabaseHelper.loginUser("wrongUser", "wrongPass"),
      ).thenAnswer((_) async => null);

      bool result = await authStore.login("wrongUser", "wrongPass");

      expect(result, false);
      expect(authStore.errorMessage, "Invalid username or password");
    });

    test('Logout should clear user data', () async {
      await authStore.logout();

      expect(authStore.isLoggedIn, false);
      expect(authStore.loggedInUsername, null);
    });

    test('Remove error message should reset errorMessage to empty', () {
      authStore.errorMessage = "Some error";
      authStore.removeErrorMessage();

      expect(authStore.errorMessage, '');
    });
  });
}
