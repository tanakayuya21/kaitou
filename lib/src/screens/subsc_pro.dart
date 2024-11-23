import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SubScPagePro extends StatefulWidget {
  // 画面遷移元からのデータを受け取る変数
  // final String value;

  // コンストラクタ
  const SubScPagePro({Key? key}) : super(key: key);

  @override
  State<SubScPagePro> createState() => _NextPageState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('枠の中に文字')),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ここに文字が入ります',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class _NextPageState extends State<SubScPagePro> {
  // 状態を管理する変数
  // late String state;

  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    // state = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    // var requestText = "${state}";
    // final _textEditingController = TextEditingController(text: state);

    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F6), // 背景色設定
      appBar: AppBar(
        title: const Text(
          '戻る',
          style: TextStyle(
            fontSize: 15,
            // color: Color.fromARGB(255, 72, 121, 255),
            fontWeight: FontWeight.bold,
            backgroundColor: Color(0xFFE5F6F6), // 背景色設定
            // letterSpacing: 2.0, // 文字間のスペース
            // wordSpacing: 5.0, //
          ),
        ),
        backgroundColor: const Color(0xFFE5F6F6), // 背景色設
      ),
      body: SingleChildScrollView(
        // 修正箇所
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 1.0, // 幅を画面の80%に設定
                  height:
                      MediaQuery.of(context).size.height * 0.6, // 高さを画面の30%に設
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 255, 255), // 背景色を水色に設定
                    border: Border.all(
                        color: const Color.fromARGB(255, 158, 116, 235),
                        width: 3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft, //任意のプロパティ
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'BASICプラン',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 158, 116, 235),
                          ),
                        ),
                        Text(
                          '・広告の非表示',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 158, 116, 235),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   // ignore: use_build_context_synchronously
                      //   context,
                      //   MaterialPdageRoute(
                      //       builder: (context) => const SubScPageStanderd()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(550, 40),
                      backgroundColor: const Color.fromARGB(255, 158, 116, 235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // 角丸の半径
                      ),
                    ),
                    child: const Text(
                      'サブスク開始',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 236, 236, 236)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   // ignore: use_build_context_synchronously
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => SubScPageStanderd()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(550, 40),
                      backgroundColor: const Color.fromARGB(255, 72, 121, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // 角丸の半径
                      ),
                    ),
                    child: const Text(
                      '復元',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 236, 236, 236)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // 省略
  }
}
