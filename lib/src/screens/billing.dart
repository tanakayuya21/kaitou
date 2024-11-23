import 'package:kaitou/src/screens/purchase_button.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class BillingPage extends StatefulWidget {
  @override
  _SubScPageState createState() => _SubScPageState();
}

class _SubScPageState extends State<BillingPage> {
  List<Package> _availablePackages = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('RevenueCat Flutter Example'),
      ),
      body: Center(
        child: _availablePackages.isEmpty
            ? const CircularProgressIndicator() // 商品が取得中の場合
            : ListView.builder(
                itemCount: _availablePackages.length,
                itemBuilder: (context, index) {
                  return ProductPurchaseButton(
                    package: _availablePackages[index],
                  );
                },
              ),
      ),
    );
  }
}

// class ProductPurchaseButton extends StatelessWidget {
//   final Package package;

//   const ProductPurchaseButton({Key? key, required this.package})
//       : super(key: key);

//   Future<void> _purchaseProduct(BuildContext context) async {
//     try {
//       final purchaserInfo = await Purchases.purchasePackage(package);
//       print('Purchase successful: ${purchaserInfo.entitlements.all}');
//       // 購入成功後の処理を追加できます
//     } catch (e) {
//       print('Purchase error: $e');
//       // エラーハンドリングの処理を追加できます
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => _purchaseProduct(context),
//       child: const Text('Buy'),
//     );
//   }
// }
