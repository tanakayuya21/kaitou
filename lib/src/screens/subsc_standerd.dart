import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'billing.dart';
import 'subsc.dart';

class SubScPageStanderd extends StatefulWidget {
  // 画面遷移元からのデータを受け取る変数
  // final String value;
  // コンストラクタ
  // const SubScPageStanderd({Key? key, required this.package}) : super(key: key);

  @override
  State<SubScPageStanderd> createState() => _NextPageState();

  // final Package package;

  // const SubScPageStanderd({Key? key, required this.package}) : super(key: key);
}

class _NextPageState extends State<SubScPageStanderd> {
  // 状態を管理する変数
  // late String state;
  List<Package> _availablePackages = [];
  late Package package;
  List<Package> _packages = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    // _fetchProducts();
    _fetchPackages();
    // 受け取ったデータを状態を管理する変数に格納
    // package = widget.package;
  }

  Future<void> _fetchPackages() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      if (offerings.current != null) {
        setState(() {
          _packages = offerings.current!.availablePackages;
          _loading = false;
        });
      }
    } catch (e) {
      print('Error fetching packages: $e');
      setState(() {
        _loading = false; // エラー時はローディングを解除
      });
    }
  }

  Future<void> _purchasePackage(Package package) async {
    try {
      final purchaserInfo = await Purchases.purchasePackage(package);
      print('Purchase successful: ${purchaserInfo.entitlements.all}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Purchase successful!')),
      );
    } catch (e) {
      print('Purchase error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _fetchProducts() async {
    await Purchases.configure(
        PurchasesConfiguration('appl_BFdGjdAkcbonHIhlWHxigrpSnQW'));
    try {
      final offerings = await Purchases.getOfferings();
      final currentOffering = offerings.current;
      if (currentOffering != null) {
        setState(() {
          _availablePackages = currentOffering.availablePackages;
          print(_availablePackages);
          print("_availablePackages");
        });
      } else {
        print('No current offerings available');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
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
      body:

          //    _availablePackages.isEmpty
          //       ? const CircularProgressIndicator()
          //       : ListView.builder(
          //           itemCount: _availablePackages.length,
          //           itemBuilder: (context, index) {
          //             final package = _availablePackages[index];
          //             return ListTile(
          //               title: Text("title"),
          //               subtitle: Text("subtitle"),
          //               trailing: ElevatedButton(
          //                 child: Text('Buy'),
          //                 onPressed: () => _purchasePackage(package),
          //               ),
          //             );
          //           },
          //         ),
          // );
          //     Center(

          //   child: _availablePackages.isEmpty
          //       ? const CircularProgressIndicator() // 商品が取得中の場合
          //       : ListView.builder(
          //           itemCount: _availablePackages.length,
          //           itemBuilder: (context, index) {
          //             print(index);
          //             print("sssss");
          //             return ListTile(
          //               title: Text("title"),
          //               subtitle: Text("subtitle"),
          //               trailing: ElevatedButton(
          //                 child: Text('Buy'),
          //                 onPressed: () => _purchasePackage(package),
          //               ),
          //             );
          //             // return

          //             //  ProductPurchaseButton(
          //             //   package: _availablePackages[index],
          //             // );
          //           },
          //         ),
          // ),
          //     Center(
          //   child: _availablePackages.isEmpty
          //       ? const CircularProgressIndicator() // 商品が取得中の場合
          //       : ListView.builder(
          //           itemCount: _availablePackages.length,
          //           itemBuilder: (context, index) {
          //             print(index);
          //             print("sssss");
          //             return ProductPurchaseButton(
          //               package: _availablePackages[index],
          //             );
          //           },
          //         ),
          // ),

          SingleChildScrollView(
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
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 255, 255, 255), // 背景色を水色に設定
                    border: Border.all(
                        color: const Color.fromARGB(255, 112, 202, 147),
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
                              fontWeight: FontWeight.w900,
                              color: const Color.fromARGB(255, 112, 202, 147)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '・広告の非表示',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 112, 202, 147)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '・広告の非表示',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 112, 202, 147)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '・広告の非表示',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 112, 202, 147)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '・広告の非表示',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 112, 202, 147)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      // _purchaseProduct(context);

                      // _purchaseProduct(context);
                      // Navigator.push(
                      //   // ignore: use_build_context_synchronously
                      //   context,
                      //   MaterialPageRoute(builder: (context) => BillingPage()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(550, 40),
                      backgroundColor: const Color.fromARGB(255, 112, 202, 147),
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

class ProductPurchaseButton extends StatelessWidget {
  final Package package;

  const ProductPurchaseButton({Key? key, required this.package})
      : super(key: key);

  Future<void> _purchaseProduct(BuildContext context) async {
    try {
      final purchaserInfo = await Purchases.purchasePackage(package);
      print('Purchase successful: ${purchaserInfo.entitlements.all}');
      // 購入成功後の処理を追加できます
    } catch (e) {
      print('Purchase error: $e');
      // エラーハンドリングの処理を追加できます
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _purchaseProduct(context),
      child: const Text('Buy'),
    );
  }
}
