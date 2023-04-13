

import 'package:clone_homework_hyunwoo/main/myCarrot/region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'newPeople.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  Widget _mainLogin(){
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 225, // 이미지의 top 위치
            left: 100,
            right: 100,// 이미지의 left 위치
            child: Image.asset(
              'assets/images/carrot.png', // 이미지 파일 경로
              width: 193, // 이미지의 폭
              height: 193, // 이미지의 높이
            ),
          ),
          Positioned(
              top: 420, // 이미지의 top 위치
              left: 125, // 이미지의 left 위치
              child: Text(
                '당신 근처의 당근마켓',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              )
          ),
          Positioned(
              top: 450, // 이미지의 top 위치
              left: 100,
              child: Text(
                '중고 거래부터 동네 정보까지,',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )
          ),
          Positioned(
              top: 468, // 이미지의 top 위치
              left: 65,
              child: Text(
                '지금 내 동네를 선택하고 시작해보세요!',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )
          ),

          Positioned(
            top: 650, // 이미지의 top 위치
            left: 33,
            child: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => newPeople()),
                    );
                  },
                  child: Text('시작하기'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(330, 55),
                    primary: Color(0xFFFF7E36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
              top: 730, // 이미지의 top 위치
              left: 105,
              child: Text(
                '이미 계정이 있나요?',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )
          ),
          Positioned(
            top: 730.0,
            right: 95.0,
            child: Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginPage()),
                  );
                },
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Color(0xFFFF7E36),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainLogin(),
    );
  }
}
