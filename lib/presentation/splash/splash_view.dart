import 'dart:async';

import 'package:flutter/material.dart';

import '../resources/constants_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/color_manager.dart';
import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goToNext);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _goToNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManger.primary,
        body: const Center(
          child: Image(
            image: AssetImage(ImagesAssets.splashLogo),
          ),
        ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
