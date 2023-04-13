import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../myCarrot/myCarrot.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<Map<String,dynamic>> datas = [];

  @override
  void initState(){
    super.initState();
    datas=[
      {
        "image" : "assets/images/mac.png",
        "title" : "맥북",
        "location" : "한동대",
        "price" : "750,000원",
        "likes" : "7",
        "reservation" : "예약중",
        "completed" : "거래 완료"
      },
      {
        "image" : "assets/images/iphone.png",
        "title" : "S22 자급제 화이트 미개봉",
        "location" : "한동대",
        "price" : "750,000원",
        "likes" : "7",
        "reservation" : "예약중",
        "completed" : "거래 완료"
      },
      {
        "image" : "assets/images/iphone.png",
        "title" : "S22 자급제 화이트 미개봉",
        "location" : "한동대",
        "price" : "750,000원",
        "likes" : "7",
        "reservation" : "예약중",
        "completed" : "거래 완료"
      },
      {
        "image" : "assets/images/iphone.png",
        "title" : "S22 자급제 화이트 미개봉",
        "location" : "한동대",
        "price" : "750,000원",
        "likes" : "7",
        "reservation" : "예약중",
        "completed" : "거래 완료"
      },
      {
        "image" : "assets/images/iphone.png",
        "title" : "S22 자급제 화이트 미개봉",
        "location" : "한동대",
        "price" : "750,000원",
        "likes" : "7",
        "reservation" : "예약중",
        "completed" : "거래 완료"
      }
    ];
  }

  Widget _bodyWidget(){
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (BuildContext _context, int index){
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        datas[index]["image"],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(datas[index]["title"]),
                            Text(datas[index]["location"],style: TextStyle(fontSize: 12,color:Colors.black.withOpacity(0.4)),),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                if (index == 0) Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.lightGreen,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                  child: Text("예약중", style: TextStyle(color: Colors.white)),
                                )else if (index == 1) Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blueGrey,
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                                  child: Text("거래완료", style: TextStyle(color: Colors.white)),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  datas[index]["price"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/images/heart2.png',
                                      width: 13,
                                      height: 13,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      datas[index]["likes"],
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                           )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext _context, int index){
              return Container(height: 1, color: Colors.black.withOpacity(0.4));
            },
            itemCount: datas.length,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
                iconSize: 30,
                color: Colors.white,
              ),
            ),
          ],
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
              "한동대",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
            Icon(Icons.expand_more, color: Colors.black), // 추가할 아이콘
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
            Icons.search,
            color: Colors.black,
          )),
          IconButton(onPressed: (){}, icon: Icon(
            Icons.notifications_none,
            color: Colors.black,
          )),
        ],
      ),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
