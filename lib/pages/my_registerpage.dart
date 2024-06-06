import 'package:flutter/material.dart';

void main() => runApp(const MyRegisterPage());

class MyRegisterPage extends StatelessWidget {
  const MyRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Register'),
            backgroundColor: Colors.deepPurple.shade50,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            )),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
