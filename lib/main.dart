import 'package:flutter/material.dart';
import 'package:login_signup/database_helper/database_selper.dart';
import 'package:login_signup/screens/authentication/auth_screen.dart';
import 'package:login_signup/constants/app_theme.dart';
import 'package:login_signup/screens/authentication/auth_store.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AuthStore>(
      create: (_) => AuthStore(databaseHelper: DatabaseHelperImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: AuthScreen(),
      ),
    );
  }
}
