import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/pages/atencao_page.dart';
import 'providers/auth_provider.dart';
import 'pages/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider()..loadFromStorage(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return authProvider.isAuthenticated
              ? const AtencaoPage()
              : const LoginPage();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
