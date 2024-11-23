// ignore_for_file: use_super_parameters
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'api_key.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../admobHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NextPage extends StatefulWidget {
  // 画面遷移元からのデータを受け取る変数
  final String value;

  // コンストラクタ
  const NextPage({Key? key, required this.value}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  // 状態を管理する変数
  late String state;

  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    state = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var requestText = "${state}";
    final _textEditingController = TextEditingController(text: state);

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
      body: Center(
        child: ClipRect(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 72, 121, 255),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                        cursorColor: const Color.fromRGBO(131, 124, 124, 1),
                        maxLines: 19,
                        controller: _textEditingController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 211, 214, 220),
                            ),
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          // contentPadding: EdgeInsets.symmetric(
                          //   vertical: 90,
                          // ), //これをtrueにしないと背景色は変わらないから注意
                          // enabledBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.all(25),
                  //   child: Text(
                  //       style: TextStyle(
                  //         fontSize: 15,
                  //         color: Color(0xFF0044F2),
                  //         fontStyle: FontStyle.italic,
                  //       ),
                  //       ""),
                  // ),

                  //
                  //ローディングを表示させるためのボタン
                ],
              )),
              // Center(
              //   child: AdWidget(
              //     ad: AdmobHelper.getLargeBannerAd()..load(),
              //   ),
              // ),
              //
              //ローディング
            ],
          ),
        ),
      ),
    );
    // 省略
  }
}
