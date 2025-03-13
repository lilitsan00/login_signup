import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_signup/screens/authentication/auth_store.dart';
import 'package:login_signup/screens/home/home_screen.dart';
import 'package:login_signup/screens/login_signup/login_signup_screen.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context, listen: false);

    return Observer(
      builder: (context) {
        if (authStore.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (authStore.isLoggedIn) {
          return HomeScreen();
        }

        return LoginSignupScreen();
      },
    );
  }
}
