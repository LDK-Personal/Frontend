import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login/Data/response/predict_response.dart';
import 'package:flutter_login/Domain/repository/api_repository.dart';
import 'package:flutter_login/components/logo.dart';
import 'package:flutter_login/di/injection_container.dart';
import 'package:flutter_login/utils/dev_log.dart';
import 'package:flutter_login/utils/file_utils.dart';
import 'package:flutter_login/utils/helper_message.dart';
import 'result_detail_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('AI가 분석하는 중입니다...', style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final PredictResponse result;
  final String imagePath; // 이미지 파일의 경로

  ResultPage(this.result, this.imagePath);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container( // SingleChildScrollView 추가
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Icon(Icons.check_circle_outline, color: Colors.green, size: 100),
                SizedBox(height: 20),
                Text('분석이 완료되었습니다.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("", style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultDetailPage(result, imagePath))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // 조절 가능한 정도
                    ),
                  ),
                  child: Text('결과 보기', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {

  final String imagePath;

  const MainPage({Key? key, required this.imagePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final apiRepository = it.get<ApiRepository>();


    return Scaffold(
      appBar: AppBar(title: Text('AI 이미지 분석')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo("애니멀봐"),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  Log.d("분석 시작 버튼 클릭됨 " + imagePath);

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => LoadingPage(),
                  );

                  try{

                    final file = File(imagePath);

                    final item = await apiRepository.uploadFile(file, (sent, total) {
                      Log.d("파일 업로드 중... $sent / $total");
                    });
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(item, file.path)),);
                  }catch(e){
                      Navigator.pop(context);
                      AppMessage.showMessage("이미지 분석에 실패하였습니다.");
                  }



                  // Future.delayed(Duration(seconds: 3), () {
                  //   Navigator.pop(context);
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ResultPage('')),
                  //   );
                  // });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(200, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 조절 가능한 정도
                  ),
                ),
                child: Text('분석 시작', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
