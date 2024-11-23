import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A3RT Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  // A3RTのTalk APIにメッセージを送信する
  Future<String> sendMessageToA3RT(String message) async {
    String apiUrl = 'https://api.a3rt.recruit.co.jp/talk/v1/smalltalk';

    String apiKey = 'ZZ0SDQ5892mvYcWjjcvdNmjCAI4zjHrO'; // ここに自分のAPIキーを入力
    //final String apiKey = 'ZZ0SDQ5892mvYcWっっっsvdNmjCAI4zjHrO'; // ここに自分のAPIキーを入力

    // APIにPOSTリクエストを送信
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "query": message,
        "apikey": apiKey,
      }),

      // body: {
      //   'apikey': apiKey,
      //   'query': message, // ユーザーからのメッセージ
      // },
    );
    print(response.body);
    print(response.statusCode);
    // APIレスポンスを処理
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      print("responseBody");
      if (responseBody['status'] == 0) {
        return responseBody['reply']; // A3RTからの返信
      } else {
        return 'エラーが発生しました: ${responseBody['message']}';
      }
    } else {
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      print("responseBody");
      return '通信エラー: ${response.statusCode}';
    }
  }

  // ユーザーのメッセージを送信
  void _sendMessage() async {
    final String userMessage = _controller.text;
    if (userMessage.isEmpty) return;

    // ユーザーのメッセージをリストに追加
    setState(() {
      _messages.add(ChatMessage(
        text: userMessage,
        isUserMessage: true,
      ));
    });

    _controller.clear();

    // A3RT APIに送信して返信を受け取る
    String aiReply = await sendMessageToA3RT(userMessage);

    // A3RTからの返信をリストに追加
    setState(() {
      _messages.add(ChatMessage(
        text: aiReply,
        isUserMessage: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A3RT Chatbot'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'メッセージを入力...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({
    required this.text,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isUserMessage ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isUserMessage ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
