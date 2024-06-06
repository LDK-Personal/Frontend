import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login/Data/local/app_preferences.dart';
import 'package:flutter_login/Data/request/board_request.dart';
import 'package:flutter_login/Data/response/board_response.dart';
import 'package:flutter_login/Domain/repository/api_repository.dart';
import 'package:flutter_login/di/injection_container.dart';
import 'package:flutter_login/utils/helper_message.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '게시판',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoticeboardPage(),
    );
  }
}

class NoticeboardPage extends StatefulWidget {
  @override
  _NoticeboardPageState createState() => _NoticeboardPageState();
}

class _NoticeboardPageState extends State<NoticeboardPage> {
  List<BoardResponse> items = [];

  final apiRepository = it.get<ApiRepository>();
  final appPreferences = it.get<AppPreferences>();

  @override
  void initState() {
    super.initState();
    getBoardItems();
  }

  Future<void> getBoardItems() async {
    try {
      final response = await apiRepository.getBoardItems();
      setState(() {
        items = response;
      });
    } catch (e) {
      setState(() {
        items = [];
      });
    }
  }

  void _deletePost(BoardResponse item) {
    setState(() {
      // items.remove(item);
    });
    _showSnackBar(context, '게시글이 삭제되었습니다.');
  }

  @override
  Widget build(BuildContext context) {
    String currentUser = appPreferences.userToken ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text('자유게시판'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _navigateToPostDetail(context, items[index]),
            child: PostCard(
              item: items[index],
              currentUser: currentUser,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String userId = appPreferences.userToken ?? "";
          if (userId != "") {
            _showPostDialog(context);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showPostDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // 배경색을 흰색으로 지정
          title: Text('새 게시글 작성'),
          content: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width * 0.9, // 전체 화면의 80% 너비
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: '게시글 제목'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: contentController,
                    decoration: InputDecoration(hintText: '게시글 내용을 입력하세요'),
                    maxLines: 5,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                  try {
                    String userId = appPreferences.userToken!;
                    final testModel =
                    BoardRequest(userId: userId, title: titleController.text, content: contentController.text);
                    final response = await apiRepository.saveBoardItem(testModel);
                    print("[saveBoardItem] response: $response");
                    if (response) {
                      AppMessage.showMessage("등록되었습니다");
                      getBoardItems();
                      Navigator.of(context).pop(); // AlertDialog 닫기
                    } else {
                      AppMessage.showMessage("등록에 실패하였습니다");
                    }
                  } catch (e) {
                    print(e);
                    AppMessage.showMessage("등록에 실패하였습니다");
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 버튼의 배경색을 검정색으로 지정
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 텍스트의 색상을 흰색으로 지정
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 버튼의 모서리를 더 둥글게 설정
                  ),
                ),
              ),
              child: Text('등록'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // AlertDialog 닫기
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 버튼의 배경색을 검정색으로 지정
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 텍스트의 색상을 흰색으로 지정
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 버튼의 모서리를 더 둥글게 설정
                  ),
                ),
              ),
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToPostDetail(BuildContext context, BoardResponse item) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailPage(
          item,
          onDeletePressed: () {
            getBoardItems();
          },
          onPostUpdated: () {
            getBoardItems();
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
}

class PostDetailPage extends StatefulWidget {
  final BoardResponse item;
  final VoidCallback? onDeletePressed;
  final VoidCallback? onPostUpdated;

  PostDetailPage(this.item, {this.onDeletePressed, this.onPostUpdated});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {

  final apiRepository = it.get<ApiRepository>();
  final appPreferences = it.get<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    String currentUser = appPreferences.userToken ?? ""; // 현재 로그인한 사용자의 ID 가져오기

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.item.userId == currentUser) // 현재 로그인한 사용자가 작성자인 경우에만 표시
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _showEditDialog(context, widget.item);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _confirmDelete(context),
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 10),
            Text(
              widget.item.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // 배경을 흰색으로 지정
          title: Text('게시글 삭제'),
          content: Text('게시글을 삭제하시겠습니까?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final response = await apiRepository.deleteBoardItem(widget.item.id);
                if (response == true) {
                  AppMessage.showMessage("삭제 되었습니다");
                  Navigator.of(context).pop();
                  widget.onDeletePressed?.call();
                } else {
                  AppMessage.showMessage("삭제에 실패하였습니다.");
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 버튼의 배경색을 검정색으로 지정
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 버튼 텍스트의 색상을 흰색으로 지정
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 버튼의 모서리를 더 둥글게 설정
                  ),
                ),
              ),
              child: Text('확인'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 버튼의 배경색을 검정색으로 지정
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 버튼 텍스트의 색상을 흰색으로 지정
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 모서리를 더 둥글게 설정
                  ),
                ),
              ),
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(BuildContext context, BoardResponse item) async {
    TextEditingController titleController = TextEditingController(text: item.title);
    TextEditingController contentController = TextEditingController(text: item.content);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white, // 배경색을 원하는 색상으로 지정
          title: Text('게시글 수정'),
          content: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: '게시글 제목'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: contentController,
                    decoration: InputDecoration(hintText: '게시글 내용을 입력하세요'),
                    maxLines: 5,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                      Navigator.of(context).pop();
                      final response = await apiRepository.updateBoardItem(item.id, BoardRequest(userId: item.id.toString(), title: titleController.text, content: contentController.text));
                      if(response == true){
                        AppMessage.showMessage("수정 되었습니다");
                        widget.onPostUpdated?.call();
                        Navigator.of(context).pop();
                      }else{
                        AppMessage.showMessage("수정에 실패하였습니다.");
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 버튼의 배경색을 검정색으로 지정
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 버튼 텍스트의 색상을 흰색으로 지정
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // 버튼의 모서리를 더 둥글게 설정
                      ),
                    ),
                  ),
                  child: Text('저장'),
                ),
                SizedBox(height: 10), // 버튼 위에 20 픽셀의 간격 추가
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // 버튼의 배경색을 검정색으로 지정
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 버튼 텍스트의 색상을 흰색으로 지정
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // 모서리를 더 둥글게 설정
                      ),
                    ),
                  ),
                  child: Text('취소'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
}

class PostCard extends StatelessWidget {
  final BoardResponse item;
  final String? currentUser;

  const PostCard({
    Key? key,
    required this.item,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '작성자: ${item.userId == currentUser ? '나' : item.userId}', // 작성자 정보 수정
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              item.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}