import 'package:flutter/material.dart';
import 'package:flutter_login/components/logo.dart';
import 'package:flutter_login/pages/select_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Logo("애니멀봐"),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPage()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black), // 검정색 배경
                foregroundColor: MaterialStateProperty.all(Colors.white), // 흰색 글자
                minimumSize: MaterialStateProperty.all(Size.fromHeight(60)), // 최소 크기를 60으로 지정
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)), // 패딩을 추가
              ),
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}