import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'subsc_standerd.dart';
import 'subsc_pro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // RevenueCatの初期化
  runApp(const SubScPage());
}

class SubScPage extends StatelessWidget {
  const SubScPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F6), // 背景色設定
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.all(23.5),
              child: //任意のプロパティ
                  Text('プランを選択',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 139, 139, 139),
                      )),
            )),
        centerTitle: true,
        titleSpacing: 0.0,
        //   actions: <Widget>[
        //     IconButton(
        //       icon: const Icon(Icons.add_alert),
        //       tooltip: 'Show Snackbar',
        //       onPressed: () {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //             const SnackBar(content: Text('This is a snackbar')));
        //       },
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.navigate_next),
        //       tooltip: 'Go to the next page',
        //       onPressed: () {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //             const SnackBar(content: Text('This is a snackbar')));
        //       },
        //     ),
        //   ],
        //   elevation: 10.0,
        //   shadowColor: Colors.blue,
        //   backgroundColor: Colors.green,
        //   foregroundColor: Colors.red,
        //   shape: const StadiumBorder(),
        //   flexibleSpace: Image.network('https://picsum.photos/200/100'),
        //   toolbarHeight: 100,
        //
      ),
      body: const Center(
        child: CardButtons(),
      ),
    );
  }
}

class CardButtons extends StatefulWidget {
  const CardButtons({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CardButtonsState createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  String? _selectedButton;

  void _onCardTap(String buttonName) {
    setState(() {
      _selectedButton = buttonName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => _onCardTap('ボタン 1'),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 203, 202, 202),
                    // _selectedButton == 'ボタン 1' ? Colors.blue : Colors.grey,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // 左寄せにする
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start, // 左寄せにする
                      children: <Widget>[
                        const Text('BASICプラン',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                // fontStyle: bold,
                                color: Color.fromARGB(255, 112, 202, 147))),
                        const Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('¥',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 112, 202, 147))),
                              Text('600',
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                      color:
                                          Color.fromARGB(255, 112, 202, 147))),
                              Text('/月',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 112, 202, 147))),
                            ]),
                        const SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubScPageStanderd()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(550, 40),
                              backgroundColor: const Color.fromARGB(
                                  255, 112, 202, 147), //タンの背景色
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30.0), // 角丸の半径
                              ),
                            ),
                            child: const Text(
                              'こちら→',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 236, 236, 236)),
                            ),
                          ),
                        ),
                        // const Text('このボタンを選択してください。'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _onCardTap('ボタン 1'),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 203, 202, 202),
                    // _selectedButton == 'ボタン 1' ? Colors.blue : Colors.grey,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft, // 左寄せにする
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start, // 左寄せにする
                      children: <Widget>[
                        const Text('Proプラン',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              // fontStyle: bold,
                              color: Color.fromARGB(255, 158, 116, 235),
                            )),
                        const Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('¥',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 158, 116, 235),
                                  )),
                              Text('1200',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromARGB(255, 158, 116, 235),
                                  )),
                              Text('/月',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 158, 116, 235),
                                  )),
                            ]),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SubScPagePro()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(550, 40),
                              backgroundColor:
                                  const Color.fromARGB(255, 158, 116, 235),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30.0), // 角丸の半径
                              ),
                            ),
                            child: const Text(
                              'こちら→',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 236, 236, 236)),
                            ),
                          ),
                        ),
                        // const Text('このボタンを選択してください。'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedButton != null)
              Text(
                '選択されたボタン: $_selectedButton',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ));
  }
}
