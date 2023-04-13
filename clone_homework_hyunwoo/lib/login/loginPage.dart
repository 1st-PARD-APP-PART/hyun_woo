import 'package:clone_homework_hyunwoo/main/home/mainScreen.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, // 검정색 아이콘 색상
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "안녕하세요!\n휴대폰 번호로 로그인 해주세요.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 11.0),
            Text(
              "휴대폰 번호는 안전하게 보관되며 이웃들에게 공개되지 않아요",
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "휴대폰 번호 (-없이 숫자만 입력)",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 15.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                hintText: "비밀번호",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("로그인"),
              onPressed: () {
                // 로그인 버튼 클릭 시 동작할 코드 작성대
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const mainScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(330, 80),
                primary: Color(0xFFFF7E36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
