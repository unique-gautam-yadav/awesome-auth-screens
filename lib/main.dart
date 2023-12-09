import 'package:flutter/material.dart';
import 'package:glass_login/auth/screens/root.dart';

/*

  Social ig = flutter.demon
  Social github = https://github.com/unique-gautam-yadav

*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(),
    );
  }
}
