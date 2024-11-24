import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // RevenueCatの初期化

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RevenueCat Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    await Purchases.configure(
        PurchasesConfiguration(''));
    try {
      // 利用可能な商品を取得
      final offerings = await Purchases.getOfferings();
      final currentOffering = offerings.current;
      if (currentOffering != null) {
        print('Available products: ${currentOffering.availablePackages}');
        // 商品リストをUIに表示する処理を追加できます
      } else {
        print('No current offerings available');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  Future<void> _purchaseProduct(Package package) async {
    try {
      // 商品の購入処理
      final purchaserInfo = await Purchases.purchasePackage(package);
      print('Purchase successful: ${purchaserInfo.entitlements.all}');
      // 購入成功後の処理を追加できます
    } catch (e) {
      print('Purchase error: $e');
      // エラーハンドリングの処理を追加できます
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RevenueCat Flutter Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final offerings = await Purchases.getOfferings();
            final currentOffering = offerings.current;
            if (currentOffering != null &&
                currentOffering.availablePackages.isNotEmpty) {
              final package = currentOffering.availablePackages.first;
              await _purchaseProduct(package);
            } else {
              print('No available packages');
            }
          },
          child: const Text('Buy Product'),
        ),
      ),
    );
  }
}
