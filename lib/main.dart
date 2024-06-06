import 'package:flutter/material.dart';
import 'package:shared_pref_demo/pages/my_login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preference Tutorial',
      home: Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: const MyLoginForm(),
      ),
    );
  }
}
