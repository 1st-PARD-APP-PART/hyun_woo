import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class region extends StatelessWidget {
  const region({Key? key}) : super(key: key);

  Widget _bodyWidget(){
    return Padding(
      padding: const EdgeInsets.all(8.0), // ListView 패딩
      child: ListView.separated(
        itemBuilder: (BuildContext _context, int index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0), // Container 패딩
            child: Row(
              children: [
                SizedBox(width: 8.0), // 왼쪽 공백
                Expanded(
                  child: Text(
                    '경상북도 포항시 북구 흥해읍 한동로 558',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 11,
        separatorBuilder: (BuildContext _context, int index){
          return Container(height: 1, color: Colors.black.withOpacity(0.4));
        },
      ),
    );
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '근처 동네',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
            ),
          ),
          Expanded(
            child: _bodyWidget(),
          ),
        ],
      ),
    );
  }
}
