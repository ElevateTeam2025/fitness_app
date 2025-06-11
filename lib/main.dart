import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Hello, World!',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

