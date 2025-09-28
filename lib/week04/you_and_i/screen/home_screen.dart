import 'package:flutter/material.dart';

// 1 쿠퍼니토 (iOS) 위젯 사용하기 위해 필요
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea( // 1 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          // 2 위아래 끝에 위젯 배치
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // 반대축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay
            ),
            _CoupleImage()
          ],
        ),
      )
    );
  }

  void onHeartPressed() {
    showCupertinoDialog( // 2 쿠퍼티노 다이얼로그 실행
      context: context, // 3 보여줄 다이얼로그 빌드
      builder: (BuildContext context) {
        // 4 날짜 선택하는 다이얼로그
        return CupertinoDatePicker(
          // 5 시간 제외하고 날짜만 선택하기
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (DateTime date) {

          },
        );
      }
    );
  }
}

class _DDay extends StatelessWidget {
  // 1 하트 눌렀을 때 실행할 함수
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay; // 1 사귀기 시작한 날

  _DDay({
    required this.onHeartPressed, // 2 상위에서 함수 입력받기
    required this.firstDay // 2 날짜 변수로 입력받기
  });

  @override
  Widget build(BuildContext context) {
  // 1 테마 불러오기
  final textTheme = Theme.of(context).textTheme;
  final now = DateTime.now(); // 3 현재 날짜시간

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text( // 최상단 U&I 글자
          'U&I',
          style: textTheme.headlineLarge, // headline1 스타일 적용
        ),
        const SizedBox(height: 16.0),
        Text( // 두 번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyLarge, // bodyText1 스타일 적용
        ),
        Text( // 임시로 지정한 만난 날짜
          // 4 DateTime을 년.월.일 형태로 변경
          '${firstDay.year} ${firstDay.month} ${firstDay.day}',
          style: textTheme.bodyMedium, // bodyText2 스타일 적용
        ),
        const SizedBox(height: 16.0),
        IconButton( // 하트 아이콘 버튼
          iconSize: 60.0,
          onPressed: onHeartPressed, // 3 아이콘 눌렀을 떄 실행할 함수
          icon: Icon(
            Icons.favorite,
            color: Colors.red, // 2 색상 빨강으로 변경
          )
        ),
        const SizedBox(height: 16.0),
        Text( // 만난 후 DDay
          // 5 DDay 계산하기
          'D+${DateTime(now.year, now.month,
                now.day).difference(firstDay).inDays + 1}',
          // headline2 스타일 적용
          style: textTheme.headlineMedium
        )
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center( // 1 이미지 중앙 정렬
      child: Image.asset(
        'asset/img/middle_image.png',

        // 2 화면의 반만큼 높이 구현
        height: MediaQuery.of(context).size.height / 2,
      )
    );
  }
}