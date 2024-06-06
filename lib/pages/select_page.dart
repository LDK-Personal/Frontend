import 'package:flutter/material.dart';
import 'package:flutter_login/components/logo.dart';
import 'package:flutter_login/pages/shooting_page.dart';
import 'package:flutter_login/pages/noticeboard_page.dart';
import 'package:flutter_login/pages/login_page.dart';

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(Size(200, 60)),
          ),
        ),
        // 로그아웃 버튼의 스타일 설정
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(Size(200, 60)),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo("애니멀봐"),
              SizedBox(height: 40),
              //"촬영하기" 버튼
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShootingPage()),
                  );
                },
                child: Text('촬영하기'),
              ),
              SizedBox(height: 8),
              // "게시판" 버튼
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoticeboardPage()),
                  );
                },
                child: Text('게시판'),
              ),
              SizedBox(height: 8),
              // "로그아웃" 버튼
              TextButton(
                onPressed: () {
                  // 로그아웃 로직 추가
                  _showLogoutDialog(context); // 로그아웃 다이얼로그 표시
                },
                child: Text('로그아웃'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 로그아웃 다이얼로그 표시 함수
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // 배경색을 흰색으로 지정
          title: Text('로그아웃'),
          content: Text('로그아웃 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                // 로그아웃 후 로그인 페이지로 이동
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                // 배경색을 검정색으로 지정
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // 글자색을 흰색으로 지정
              ),
              child: Text('로그아웃'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                // 배경색을 검정색으로 지정
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // 글자색을 흰색으로 지정
              ),
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }
}