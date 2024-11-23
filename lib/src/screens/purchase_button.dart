import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class ProductPurchaseButton extends StatelessWidget {
  final Package package;

  const ProductPurchaseButton({super.key, required this.package});

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
      onPressed: () {
        _purchaseProduct(context);
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
    );
    ElevatedButton(
      onPressed: () {
        _purchaseProduct(context);
        // Navigator.push(
        //   // ignore: use_build_context_synchronously
        //   context,
        //   MaterialPageRoute(builder: (context) => BillingPage()),
        // );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(550, 40),
        backgroundColor: const Color.fromARGB(255, 112, 202, 147), //タンの背景色
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // 角丸の半径
        ),
      ),
      child: const Text(
        'こちら→',
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 236, 236, 236)),
      ),
    );

    // ElevatedButton(
    //   onPressed: () => _purchaseProduct(context),
    //   child: const Text('Buy'),
    // );
  }
}
