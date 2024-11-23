import 'package:flutter/material.dart';
import '../../admobHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F6), // 背景色設定
      appBar: AppBar(
        title: const Text('メンテナンス中'),
        backgroundColor: const Color(0xFFE5F6F6), // 背景色設定
      ),
      body: Center(
          // child: AdWidget(
          //   ad: AdmobHelper.getLargeBannerAd()..load(),
          // ),
          ),
    );
  }
}
