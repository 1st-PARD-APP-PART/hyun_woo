
import 'package:clone_homework_hyunwoo/main/myCarrot/editProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login/login.dart';
import '../home/mainScreen.dart';


class myCarrot extends StatefulWidget {
  const myCarrot({Key? key}) : super(key: key);

  @override
  State<myCarrot> createState() => _myCarrotState();
}

class _myCarrotState extends State<myCarrot> {

  Widget _buildCircleButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFCEEE0),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(icon),
            color: Color(0xFFFF7E36),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _bodyWidget(){
    return Column(
      children: [
        // 첫 번째 라인
        Row(
          children: [
            // 이미지
            Image.asset(
              "assets/images/you.png",
              width: 129,
              height: 125,
            ),
            // 텍스트와 아이콘
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 텍스트
                    Text(
                      "본인 이름",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // 아이콘
                    GestureDetector(
                      child: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => editProfile()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 380.0,
          child: Divider(
            thickness: 3.0,
          ),
        ),
        // 첫 번째 라인과 두 번째 라인 사이 구분선 추가
        // 두 번째 라인
        Container(
          height: 130,
          width: 350,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCircleButton(Icons.view_list, '판매내역'),
                    SizedBox(width: 50),
                    _buildCircleButton(Icons.shopping_bag, '구매내역'),
                    SizedBox(width: 50),
                    _buildCircleButton(Icons.favorite, '관심목록'),
                  ],
                ),
              ),
            ),
          ),
        ),

        Container(
          width: 380.0,
          child: Divider(
            thickness: 3.0,
          ),
        ), // 두 번째 라인과 세 번째 라인 사이 구분선 추가
        // 세 번째 라인
        Container(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "최근 판매 내역",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Container(
          width: 380.0,
          child: Divider(
            thickness: 3.0,
          ),
        ),// 세 번째 라인과 네 번째 라인 사이 구분선 추가
        // 네 번째 라인
        Container(
          height: 280,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage('assets/images/iphone.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black12.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Text(
              '갤럭시 S22',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomNavigationBarWidget() {
    int _currentIndex = 0;
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          label: '홈',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '나의 당근',
          icon: Icon(Icons.person),
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mainScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => myCarrot()),
          );
        }
      },
      type: BottomNavigationBarType.fixed, // 추가된 코드
      showSelectedLabels: true, // 추가된 코드
      showUnselectedLabels: true, // 추가된 코드
      // 아래 코드 추가
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      selectedLabelStyle: TextStyle(color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              "나의 당근",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [

          GestureDetector(
            onTap: () {
              // 로그아웃 기능 수행
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => login()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top:15,right: 15),
              child: Text(
                "로그아웃",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}