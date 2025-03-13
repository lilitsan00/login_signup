import 'package:flutter/material.dart';
import 'package:login_signup/screens/authentication/auth_screen.dart';
import 'package:login_signup/screens/authentication/auth_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authStore.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('Welcome! You are logged in.')),
    );
  }
}
