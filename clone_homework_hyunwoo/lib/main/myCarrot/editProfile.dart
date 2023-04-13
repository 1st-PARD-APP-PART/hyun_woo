
import 'package:clone_homework_hyunwoo/main/myCarrot/myCarrot.dart';
import 'package:clone_homework_hyunwoo/main/myCarrot/region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class editProfile extends StatelessWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // 이전 페이지로 돌아가는 코드
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => myCarrot()),
            );
          },
          color: Colors.black, // 아이콘 색상 추가
        ),
        title: Text(
            '프로필 수정',
          style: TextStyle(
            color: Colors.black, // 텍스트 색상을 검정으로 변경
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
      ),
    body: Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // 모든 위젯을 수직 방향으로 중앙에 정렬
        children: [
          SizedBox(height: 16),
          Image.asset(
            "assets/images/you.png",
            width: 170,
            height: 170,
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: "본인의 이름을 적어주세요",
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 360.0,
            child: Divider(
              thickness: 1.0,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                  "사는 곳",
                style: TextStyle(
                  fontSize: 18,
                ),

              ), // 텍스트
              SizedBox(width: 270),
              GestureDetector(
                child: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => region()),
                  );
                },
              ), // 아이콘
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 360.0,
            child: Divider(
              thickness: 1.0,
            ),
          ),
          SizedBox(height: 220),
          ElevatedButton(
            child: Text(
                "완료",
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),
            ),
            onPressed: () {
              // 로그인 버튼 클릭 시 동작할 코드 작성대
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const myCarrot()),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(350, 80),
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
