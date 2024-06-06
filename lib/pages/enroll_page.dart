import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'loading_page.dart';

class EnrollPage extends StatefulWidget {
  final String imagePath;

  const EnrollPage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _EnrollPageState createState() => _EnrollPageState();
}

class _EnrollPageState extends State<EnrollPage> {
  late String imagePath;
  bool imageUploaded = false;

  @override
  void initState() {
    super.initState();
    imagePath = widget.imagePath;
    imageUploaded = imagePath.isNotEmpty;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100, // 이미지 품질을 최대로 설정
    );

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
        imageUploaded = true;
      });
    }
  }

  void _showCompletionDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            '알림',
            style: TextStyle(color: Colors.black),
          ),
          content: Text(
            '등록이 완료되었습니다.',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage(imagePath: imagePath)),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text(
                '확인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('등록하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUploaded
                ? Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(imagePath)),
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(),
            SizedBox(height: 20),
            !imageUploaded
                ? IconButton(
              onPressed: () {
                _pickImage();
              },
              icon: Icon(Icons.image),
              iconSize: 40,
              color: Colors.black,
            )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showCompletionDialog(context, widget.imagePath);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // 조절 가능한 정도
                ),
              ),
              child: Text('등록하기', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}