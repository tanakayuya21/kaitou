import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '/api_key.dart';
import '/next.dart';
// import 'package:google_fonts/google_fonts.dart';

import "/overlay_loading_molecules.dart";
// import '../../admobHelper.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import '/config.dart';

const kGeminiApiKey = API_KEY;
void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Best Answer!(ChatGPT搭載)'),
    );
  }
}

enum RadioValue { FIRST, SECOND, THIRD }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Fruits { Apple, Orange, Grape }

var _radVal = Fruits.Apple;

class _MyHomePageState extends State<MyHomePage> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();

  bool _loading = false;
  final String _apiKey = kGeminiApiKey;
  var _answer = '';
  var _isLoading = false;
  bool visibleLoading = false;

  final _textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: _apiKey,
    );
    _chat = _model.startChat();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  onPressMyButton() async {
    //ローディングを表示
    setState(() {
      visibleLoading = true;
    });

    //２秒待つ
    await Future.delayed(const Duration(milliseconds: 1500), () {});

    //ローディングを非表示
    setState(() {
      visibleLoading = false;
    });
  }

  _onChanged(Fruits value) {
    setState(() {
      _radVal = value;
    });
  }

  String _flag = '';
  void _handleRadioButton(String flag) => setState(() {
        _flag = flag;
      });
  int _value = 1; // int型の変数.
  String _text = ''; // String型の変数.
  RadioValue _gValue = RadioValue.FIRST;
  _onRadioSelected(value) {
    setState(() {
      _gValue = value;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int? _selectedValue = 1;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    RadioValue _gValue = RadioValue.FIRST;
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F6), // 背景色設定
      // appBar: AppBar(
      //   title: const Text('HOME'),
      // ), // body:
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
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 72, 121, 255),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      cursorColor: const Color.fromRGBO(131, 124, 124, 1),
                      maxLines: 17,
                      // minLines: 1,
                      controller: _textEditingController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 211, 214, 220),
                          ),
                        ),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Center(
                      child: Column(children: [
                    Visibility(
                      visible: value,
                      child: const Text(
                        'インターネットに接続してください。',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 213, 107, 128),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Row(
                        children: [
                          const Text(
                            'あなたの性別',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 74, 116, 222),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Radio(
                              value: 1,
                              activeColor: Colors.blue,
                              groupValue: _selectedValue!,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                  print(_selectedValue);
                                });
                              }),
                          const Text('男性'),
                          Radio(
                              value: 2,
                              activeColor: Colors.blue,
                              groupValue: _selectedValue!,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value;
                                  print(_selectedValue);
                                });
                              }),
                          const Text('女性'),
                        ],
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                      // width: 300,
                    ),
                    Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      ElevatedButton(
                        onPressed: () async {
                          onPressMyButton();
                          setState(() {
                            _isLoading = true;
                          });
                          print(_textEditingController.text +
                              "とメールが来た時、サバサバしながらも好感を得る理想の返し方は?");
                          var sex = "恋人";
                          if (_selectedValue == 1) {
                            sex = "彼女";
                          }
                          if (_selectedValue == 2) {
                            sex = "彼氏";
                          }
                          var requestText =
                              "${_textEditingController.text}と$sexからメールが来た時、タメ語で100文字以内でツンンツしなら荒い言葉で、好意を持たれる理想の返信コメントを記述してください";
                          String? answer;

                          _sendChatMessage(requestText);

                          if (answer == "") {
                            value = true;
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF40DAE4),
                                Color.fromARGB(255, 74, 116, 222),
                              ],
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: const Text(
                              'ツンツン',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                // letterSpacing: 2.0, // 文字間のスペース
                                // wordSpacing: 5.0, //
                              ),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () async {
                          onPressMyButton();
                          setState(() {
                            _isLoading = true;
                          });
                          print(_textEditingController.text +
                              "とメールが来た時、サバサバしながらも好感を得る理想の返し方は?");
                          var sex = "恋人";
                          if (_selectedValue == 1) {
                            sex = "彼女";
                          }
                          if (_selectedValue == 2) {
                            sex = "彼氏";
                          }

                          var requestText =
                              "${_textEditingController.text}と彼女からメールが来た時、おっとりしながらもタメ語で100文字以内で好意を持たれる理想の返信コメントを記述してください";
                          String answer = "";
                          print("answer");
                          print(answer);
                          print("answer");

                          _sendChatMessage(requestText);
                          if (answer == "") {
                            print("aaaaaa");
                            value = true;
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF40DAE4),
                                Color.fromARGB(255, 74, 116, 222),
                              ],
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: const Text(
                              'おっとり',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () async {
                          onPressMyButton();
                          var sex = "恋人";
                          if (_selectedValue == 1) {
                            sex = "彼女";
                          }
                          if (_selectedValue == 2) {
                            sex = "彼氏";
                          }
                          var requestText =
                              "${_textEditingController.text}と$sexからメールが来た時、穏やかに敬語で100文字以内で好意を持たれる理想の返信コメントを記述してください";

                          String? answer = "";
                          print("answer");
                          print(answer);
                          print("answer");

                          _sendChatMessage(requestText);
                        },
                        // ignore: sort_child_properties_last
                        child: Ink(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3.0),
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF40DAE4),
                                Color.fromARGB(255, 74, 116, 222),
                              ],
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: const Text(
                              'きっちり',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ]),
                    // SizedBox(
                    //   height: 13.0,
                    // ),
                  ])),

                  // Padding(
                  //   padding: const EdgeInsets.all(25),
                  //   child: Text(
                  //       style: const TextStyle(
                  //         fontSize: 15,
                  //         color: Color(0xFF0044F2),
                  //         fontStyle: FontStyle.italic,
                  //       ),
                  //       "${_answer}"),
                  // ),
                  //
                  //ローディングを表示させるためのボタン
                  // ElevatedButton(
                  //   onPressed: onPressMyButton,
                  //   child:
                  //       const Text('ローディングを表示', style: TextStyle(fontSize: 20)),
                  // ),
                ],
              )),
              // Center(
              //   child: AdWidget(
              //     ad: AdmobHelper.getLargeBannerAd()..load(),
              //   ),
              // ),
              //
              //ローディング
              OverlayLoadingMolecules(visible: visibleLoading)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });
    final String? text;
    try {
      final response = await _chat.sendMessage(
        Content.text(message),
      );

      text = response.text;
      if (text != "") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage(value: text!)),
        );
      }
      if (text == null) {
        _showError('No response from API.');
        // return null;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
        print("1");
        // return text;
      }
      // return text;
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      print("2");
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.image,
    this.text,
    required this.isFromUser,
  });

  final Image? image;
  final String? text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
            child: Container(
                constraints: const BoxConstraints(maxWidth: 520),
                decoration: BoxDecoration(
                  color: isFromUser
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(children: [
                  if (text case final text?) MarkdownBody(data: text),
                  if (image case final image?) image,
                ]))),
      ],
    );
  }
}
