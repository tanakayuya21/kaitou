// ignore_for_file: use_super_parameters
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'api_key.dart';
import 'next.dart';

import '../src/screens/account.dart';
import '../src/screens/bookmark.dart';
import '../src/screens/home.dart';
import '../src/screens/notification.dart';
import 'src/screens/subsc.dart';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../admobHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'admobHelper.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const kOpenApiKey = writeYourOpenAPIKey;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'e-KAITOU(ChatGPT搭載)'),
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
  var _answer = '';
  var _isLoading = false;
  bool visibleLoading = false;

  final _textEditingController = TextEditingController(text: '');

  final openAI = OpenAI.instance.build(
    token: kOpenApiKey,
    baseOption: HttpSetup(),
    enableLog: true,
  );
  List<Package> _availablePackages = [];

  @override
  void initState() {
    super.initState();
    // _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final offerings = await Purchases.getOfferings();
      final currentOffering = offerings.current;
      if (currentOffering != null) {
        setState(() {
          _availablePackages = currentOffering.availablePackages;
        });
      } else {
        print('No current offerings available');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  onPressMyButton() async {
    //ローディングを表示
    setState(() {
      visibleLoading = true;
    });

    //２秒待つ
    await Future.delayed(const Duration(milliseconds: 2000), () {});

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

  static final _screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const SubScPage(),
    const BookmarkScreen(),
  ];

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: const Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          elevation: 200, //

          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 148, 214, 247),
        ),
        // body:
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
                child: AdWidget(
                  ad: AdmobHelper.getLargeBannerAd()..load(),
                ),
              ),
              Expanded(
                child: _screens[_selectedIndex],
                // Column(children: [
              )
            ],
          ),
        ),
        bottomNavigationBar: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                unselectedItemColor: const Color.fromARGB(255, 172, 170, 170),
                selectedItemColor: const Color.fromARGB(255, 22, 87, 207),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'ホーム',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: 'お知らせ'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard), label: '購入'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'プライバシー'),
                ],
                type: BottomNavigationBarType.fixed,
              )
            ]));
  }
}
