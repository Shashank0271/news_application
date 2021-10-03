import 'package:flutter/material.dart';
import 'package:news/loadingScreen.dart';
import 'loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=6dd4829f4a4c4039b96fcc22a7ae841e'),
    );
  }
}
