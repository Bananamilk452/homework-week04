import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async'; // 1 async 패키지 불러오기

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState(); // 3 부모 initState() 실행

    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        int? nextPage = pageController.page?.toInt();

        if (nextPage == null) {
          return;
        }
        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1 상태바 색상 변경
    // 상태바가 이미 흰색이면 light 대신에 dark를 주어 검정으로 바꾸세요.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);

    return Scaffold(
      body: PageView( // 1 PageView 추가
        controller: pageController,
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