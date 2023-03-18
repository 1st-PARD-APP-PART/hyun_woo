import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _switchValue = false;
  String? _radioValue = "A";
  final _textFieldController = TextEditingController();
  bool _checkBoxValue = false;

  //하단에 메세지가 나오게 하는 함수입니다.
  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("This is a snackbar!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  //눌렀을 때 중간에 메세지가 나오게 됩니다.
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("This is an alert dialog!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
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
        title: Text("Flutter Demo"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader( //  일반적으로 애플리케이션의 로고, 앱 이름 또는 앱 버전과 같은 정보를 표시하는 머리글을 나타냅니다.
              child: Text(
                "21800030 구현우",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Drawer Item 1"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text("Drawer Item 2"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: _switchValue,
                  onChanged: (value) => setState(() => _switchValue = value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio( // 여러 개의 선택 사항 중 하나를 선택할 수 있는 라디오 버튼을 제공하는 위젯입니다.
                      value: "A",
                      groupValue: _radioValue,
                      onChanged: (value) =>
                          setState(() => _radioValue = value as String),
                    ),
                    Text("A"),
                    Radio(
                      value: "B",
                      groupValue: _radioValue,
                      onChanged: (value) =>
                          setState(() => _radioValue = value as String),
                    ),
                    Text("B"),
                    Radio(
                      value: "C",
                      groupValue: _radioValue,
                      onChanged: (value) =>
                          setState(() => _radioValue = value as String),
                    ),
                    Text("C"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField( //TextField는 사용자가 텍스트를 입력할 수 있는 위젯입니다. 이 위젯은 사용자 입력을 받아들이기 위한 텍스트 필드를 제공합니다.
                    decoration: InputDecoration(
                      hintText: '글을 입력해주세요.',
                    ),
                    controller: _textFieldController,
                  ),
                ),
                Checkbox(
                  value: _checkBoxValue,
                  onChanged: (value) => setState(() => _checkBoxValue = value!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.red,
                        onPressed: (){
                        }
                    ),
                    Switch(
                      value: _switchValue,
                      onChanged: (value) =>
                          setState(() => _switchValue = value),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.amberAccent,
                      ),
                      onPressed: () {
                        _showAlertDialog();
                      },
                      child: Text("Show Alert Dialog"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        _showSnackBar();
                      },
                      child: Text("Show Snack Bar"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder( // 스크롤 가능한 리스트를 만드는 위젯입니다.
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          "Item $index",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // 폰트 무게를 Bold로 설정
                          ),
                        ),

                        subtitle: Text("Subtitle $index"),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: GridView.count( //  행과 열로 구성된 격자 레이아웃을 만듭니다.
                    crossAxisCount: 3,
                    children: List.generate(9, (index) {
                      return Card(
                        color: Colors.grey[300],
                        child: Center(
                          child: Text("Item $index"),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}