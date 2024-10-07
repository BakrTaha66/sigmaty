import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sigmaty/Sigmaty/constants/assets_data.dart';

class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({super.key});

  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => context.push('/Onboarding'));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsData.backgroundSigmaty),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Image.asset(
              AssetsData.sigmatyLogo,
              width: screenWidth * 0.5, // ضبط العرض حسب حجم الشاشة
              height: screenHeight * 0.2, // ضبط الارتفاع حسب حجم الشاشة
              fit:
                  BoxFit.contain, // استخدام contain لضمان احتواء الصورة بالكامل
            ),
          ),
        ),
      ),
    );
  }
}
