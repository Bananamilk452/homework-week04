import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  

  // 1 const 생성자
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Home Screen'),
    );
  }
}