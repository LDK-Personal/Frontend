import 'package:flutter/material.dart';
import 'package:flutter_login/Data/local/app_preferences.dart';
import 'package:flutter_login/Data/request/board_request.dart';
import 'package:flutter_login/Data/request/login_request.dart';
import 'package:flutter_login/Domain/repository/api_repository.dart';
import 'package:flutter_login/di/injection_container.dart';
import 'package:flutter_login/pages/home_page.dart';
import 'package:flutter_login/pages/login_page.dart';
import 'package:flutter_login/pages/signup_page.dart';
import 'package:flutter_login/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

Future<void> apiCallTest() async {

  //먼저 사용할 화면에서 아래의 함수를 호출한다.

  //API 통신을 위한 Repository
  final apiRepository = it.get<ApiRepository>();

  //로컬 캐싱을 위한 클래스
  final appPreferences = it.get<AppPreferences>();


  //로그인 API 사용
  try{
    String id = "12345";
    String password = "12345";
    final response = await apiRepository.login(LoginRequest(id: id, password: password));
    print("login response: $response");
    if(true){
      //로그인이 성공하면 로그인에 성공한 아이디를 캐싱 해주세요.
      //
      // 아래의 함수를 사용해서
      await appPreferences.login("12345");
    }
  }catch(e){
    print(e);
  }

  try{
    final response = await apiRepository.register(LoginRequest(id: "123456", password: "123456"));
    print("[Login register] response: $response");
    //response가 true면 로그인성공
  }catch(e){
    print(e);
  }

  try{
    String userId = appPreferences.userToken ?? "";
    //userToekn 이 null이면 로그인이 안된상태이므로 체크 필요
    final testModel = BoardRequest(userId: userId, title: "타이틀 테스트", content: "내용 테스트");
    final response = await apiRepository.saveBoardItem(testModel);
    print("[saveBoardItem] response: $response");
    //response가 true면 로그인성공
  }catch(e){
    print(e);
  }

  try{
    final response = await apiRepository.getBoardItems();
    print("[getBoardItems] ------------------------------------");
    response.forEach((element) {
      print("[getBoardItems] item: ${element}");
    });
    print("[getBoardItems] ------------------------------------");
    //response가 true면 로그인성공
  }catch(e){
    print(e);
  }


  try{
    //id 값에 상세 접근
    final id = 3;
    final response = await apiRepository.getBoardItem(id);
    print("[getBoardItem] item: ${response}");
    //response가 true면 로그인성공
  }catch(e){
    print(e);
  }

  //주석을 풀고 사용하세요!!!!!

  // try{
  //   //삭제 호출
  //   final id = 3;
  //   final response = await apiRepository.deleteBoardItem(id);
  //   print("[getBoardItem] item: ${response}");
  //   //response가 true면 로그인성공
  // }catch(e){
  //   print(e);
  // }
  //
  // try{
  //   //삭제 호출
  //   final id = 3;
  //   final response = await apiRepository.updateBoardItem(id, BoardRequest(userId: "12345", title: "타이틀 수정", content: "내용 수정"));
  //   print("[getBoardItem] item: ${response}");
  //   //response가 true면 로그인성공
  // }catch(e){
  //   print(e);
  // }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/signup": (context) => SignupPage(),
      },
    );
  }
}
