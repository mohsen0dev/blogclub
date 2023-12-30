import 'package:blogclub/screen/onbprding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List test = [1, 2, 3, 4];
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnBordingScreen();
      }));
    });
    return Scaffold(
      body: Stack(
        children: [
          listItems(list: test),
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

class listItems extends StatelessWidget {
  final List list;
  const listItems({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.red,
          child: Text(list[index].toString()),
        );
      },
    );
  }
}
