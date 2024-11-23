import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F6), // 背景色設定
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: const Center(
          child: Text('アカウント画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}
