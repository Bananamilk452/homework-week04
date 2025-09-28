import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  

  // 1 const 생성자
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1 앱바 위젯 추가
      appBar: AppBar(
        
        // 배경색 지정
        backgroundColor: Colors.orange,

        // 3 앱 타이틀 생성
        title: Text('Code Factory'),

        // 4 가운데 정렬
        centerTitle: true,
      ),
      body: Text('Home Screen'),
    );
  }
}