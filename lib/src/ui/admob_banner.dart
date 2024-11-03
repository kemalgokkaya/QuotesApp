import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobBanner extends StatefulWidget {
  const AdMobBanner({super.key});

  @override
  State<AdMobBanner> createState() => _AdMobBannerState();
}

class _AdMobBannerState extends State<AdMobBanner>
    with AutomaticKeepAliveClientMixin {
  late BannerAd bannerAd;
  bool bannerIsReady = false;

  void loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: "ca-app-pub-3323165490285936/3282086761",
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bannerIsReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    loadBannerAd();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return bannerIsReady
        ? SizedBox(
            width: MediaQuery.of(context).size.width % 80,
            height: MediaQuery.of(context).size.width % 110,
            child: AdWidget(ad: bannerAd),
          )
        : SizedBox.shrink();
  }

  @override
  bool get wantKeepAlive => true;
}
