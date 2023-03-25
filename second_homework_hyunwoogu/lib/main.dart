import 'package:flutter/material.dart';
import 'data.dart'; // data.dart의 정보를 import 한다.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyPage(),
    );
  }
}


class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  //_getData() 함수 내부에서는 Future.delayed() 메소드를 사용하여 10초의 딜레이를 발생시키고, then() 메소드를 사용하여 10초 후에 로드된 데이터를 출력합니다.
  //then() 메소드는 Future 객체가 완료될 때 실행되는 콜백 함수를 정의합니다. 콜백 함수는 "출력 완료" 문자열을 출력하고, myData 변수를 반환합니다.
  Future<List<String>> _getData() async {
    // 1. Future를 통해 data.dart의 리스트 정보를 가져올 때 async, await와 Future.delayed를 활용하여 10초의 정지 시간을 갖도록 한다.
    // 2. 10초가 지난 후 리스트 정보를 가져왔다면 then()을 활용하여 console창에 ‘출력 완료’ 라는 text가 출력하도록 만들어준다.
    return await Future.delayed(Duration(seconds: 10), () {
      return myData;
    }).then((value) {// 이 부분을 통해서 '출력완료'가 이루어지게 했다.
      print('출력 완료');
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),

      //이 코드는 비동기적으로 데이터를 로드하고 그 결과를 ListView로 출력합니다.
      /*
      * FutureBuilder 위젯은 future 매개변수로 비동기 작업을 수행하는 Future 객체를 받습니다. 이 경우 _getData() 함수가 Future 객체를 반환합니다.
      * builder 매개변수는 Future 객체가 처리될 때마다 호출되어, 데이터 로딩 상태에 따라 UI를 빌드합니다.
      * snapshot.connectionState는 현재 연결 상태를 나타내는 ConnectionState 열거형 값입니다. waiting이면 데이터 로딩 중, done이면 데이터 로딩이 완료된 상태입니다.
      * snapshot.hasData는 Future 객체에서 데이터가 성공적으로 로드되었는지 여부를 나타내는 불리언 값입니다.
      * ListView.builder 위젯은 데이터를 동적으로 출력하기 위해 사용되며, itemCount 매개변수는 출력될 데이터 항목의 수를 지정합니다. itemBuilder 매개변수는 각 항목을 렌더링하는 방법을 지정합니다.
      * ListTile 위젯은 ListView 위젯 내에서 각 항목을 나타내는 위젯입니다. 문제에서는 Text 위젯을 포함하여 각 데이터 항목을 출력합니다.
      * snapshot.hasError는 Future 객체에서 오류가 발생한 경우를 나타내는 불리언 값입니다. 오류 메시지를 출력하기 위해 Text 위젯이 사용됩니다.
      * else 블록은 데이터가 없는 경우를 처리하며, 데이터가 없다는 메시지를 출력합니다.
      *
      * ->Summarize the information you asked chatgpt about FutureBuilder, ListView.builder and ListTile.
      * */
      body: FutureBuilder<List<String>>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]), // 화면에 myData 정보를 UI로 보여주는 부분이다.
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error occurred: ${snapshot.error}'));
            } else {
              return Center(child: Text('No data'));
            }
          },// 3. FutureBuilder<List<String>>와 Listview.Builder를 활용하여 아래 ListTile 코드를 통해 결과 화면과 같은 화면을 출력한다.
      ),
    );
  }
}