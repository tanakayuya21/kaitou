import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//プラットホームごとのテスト広告IDを取得するメソッド
String getTestAdBannerUnitId() {
  String testBannerUnitId = "";
  if (Platform.isAndroid) {
    // Android のとき
    testBannerUnitId = "ca-app-pub-3940256099942544/2934735716";
    // testBannerUnitId = "ca-app-pub-8797688860098728/9939874399";
  } else if (Platform.isIOS) {
    // iOSのとき
    // testBannerUnitId = "ca-app-pub-3940256099942544/2934735716";
    // testBannerUnitId = "ca-app-pub-3940256099942544/2934735716";
    // testBannerUnitId = "ca-app-pub-8797688860098728/
    // 9939874399";
    // testBannerUnitId = "ca-app-pub-3940256099942544/6300978111";

    // 本番
    testBannerUnitId = "ca-app-pub-3940256099942544/2934735716";
    // testBannerUnitId = "ca-app-pub-8797688860098728/4962405491";
    // testBannerUnitId = "ca-app-pub-8797688860098728/3992938753";
    // "ca-app-pub-8797688860098728~7946031170";
    // ca-app-pub-8797688860098728/9939874399
  }
  return testBannerUnitId;
}

//プラットホームごとの広告IDを取得するメソッド
String getAdBannerUnitId() {
  String bannerUnitId = "";
  if (Platform.isAndroid) {
    // Android のとき
    bannerUnitId = "ca-app-pub-8797688860098728/9939874399";
  } else if (Platform.isIOS) {
    // iOSのとき
    // bannerUnitId = "ca-app-pub-8797688860098728/9939874399";
    // bannerUnitId = "ca-app-pub-8797688860098728/9939874399";
    // 本番
    // bannerUnitId = "ca-app-pub-8797688860098728/4962405491";
    // bannerUnitId = "ca-app-pub-8797688860098728/3992938753";
    // テスト用
    // bannerUnitId = "ca-app-pub-3940256099942544/2934735716";
// ca-app-pub-3940256099942544/6300978111
    //bannerUnitId = "ca-app-pub-3940256099942544/2934735716";
    bannerUnitId = "ca-app-pub-8797688860098728/4962405491";
  }
  return bannerUnitId;
}

class AdmobHelper {
  //初期化処理
  static initialization() {
    // getLargeBannerAd();
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  //バナー広告を初期化する処理
  static BannerAd getBannerAd() {
    BannerAd bAd = BannerAd(
      adUnitId: getTestAdBannerUnitId(),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        onAdClosed: (Ad ad) {
          print('ad dispose.');
          ad.dispose();
        },
      ),
    );
    return bAd;
  }

  //ラージサイズのバナー広告を初期化する処理
  static BannerAd getLargeBannerAd() {
    BannerAd bAd = BannerAd(
      adUnitId: getTestAdBannerUnitId(),
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        onAdClosed: (Ad ad) {
          print('ad dispose.');
          ad.dispose();
        },
      ),
    );
    return bAd;
  }
}
