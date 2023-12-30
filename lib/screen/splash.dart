import 'package:blogclub/screen/onbprding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnBordingScreen();
      }));
    });
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/img/background/splash.png',
            fit: BoxFit.cover,
          )),
          Center(
            child: SvgPicture.asset(
              'assets/img/icons/LOGO.svg',
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
