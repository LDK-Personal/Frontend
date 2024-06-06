import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_login/Data/request/login_request.dart';
import 'package:flutter_login/Domain/repository/api_repository.dart';
import 'package:flutter_login/di/injection_container.dart';
import 'package:flutter_login/utils/dev_log.dart';
import 'package:flutter_login/utils/helper_message.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  String _errorMessage = '';

  final apiRepository = it.get<ApiRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'ID',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordCheckController,
                decoration: InputDecoration(
                  labelText: 'Password Check',
                ),
                obscureText: true,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _validateAndSignUp(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // 버튼의 배경색을 검정색으로 지정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // 모서리를 더 둥글게 설정
                  ),
                ),
                child: Text('Sign Up'),
              ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndSignUp(BuildContext context) {
    if (_idController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _passwordCheckController.text.isEmpty ||
        _userNameController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Please fill out all fields.';
      });
    } else if (_passwordController.text != _passwordCheckController.text) {
      setState(() {
        _errorMessage = 'Password and Password Check do not match.';
      });
    } else {
      setState(() {
        _errorMessage = '';
      });
      _performSignUp(context);
    }
  }

  void _performSignUp(BuildContext context) async {
    String memberId = _idController.text.trim();
    String username = _userNameController.text.trim();
    String memberPassword = _passwordController.text.trim();

    Log.d("memberId : $memberId , memberPassword : $memberPassword , username : $username");

    try {
      final response = await apiRepository.register(LoginRequest(id: memberId, password: memberPassword));

      if (response == true) {
        AppMessage.showMessage('User Create Success');
        Navigator.pop(context);
      } else {
        setState(() {
          _errorMessage = 'User Create Failed.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
      });
    }
  }
}
