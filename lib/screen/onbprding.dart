import 'package:blogclub/screen/home_screen.dart';
import 'package:blogclub/screen/login.dart';
import 'package:flutter/material.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.1,
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/img/background/onboarding.png',
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: h * 0.5,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 64),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(28)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff5282FF).withOpacity(0.15),
                        // spreadRadius: 5,
                        blurRadius: 32,
                        offset: Offset(0, -25), // changes position of shadow
                        //first paramerter of offset is left-right

                        //second parameter is top to down
                      )
                    ]),
                child: Column(
                  children: [
                    Text(
                      'Read the article you want instantly',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.'),
                    Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              dotWidgets(),
                              dotWidgets(),
                              dotWidgets(),
                              dotWidgets(
                                  width: 20, color: Colors.blue.shade800),
                            ],
                          ),
                        ),
                        Spacer(),
                        MaterialButton(
                          color: Colors.blue[800],
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return const Login();
                              },
                            ));
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dotWidgets({double? width = 10, Color? color = Colors.grey}) {
    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
    );
  }
}
