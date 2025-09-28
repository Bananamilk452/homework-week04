import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView( // 1 PageView 추가
        children: [1, 2, 3, 4, 5] // 2 샘플 리스트 생성
            .map( // 3 위젯으로 매핑
        (number) => Image.asset(
                'asset/img/image_$number.jpeg',
                fit: BoxFit.cover
              )
            )
            .toList(),
      )
    );
  }
}