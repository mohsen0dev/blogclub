import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: h * 0.07),
            Center(
              child: SvgPicture.asset('assets/img/icons/LOGO.svg', width: 120),
            ),
            SizedBox(height: h * 0.07),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                          Text('SIGNUP',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 15)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h * 0.04,
                              ),
                              Text(
                                'Welcome back',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Text('Login to your account'),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
                              ),
                              SizedBox(
                                height: h * 0.04,
                              ),
                              MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                color: Colors.blue[800],
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {},
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Forgot password?'),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Reset here'))
                                ],
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Center(
                                child: Text(
                                  'OR SIGN IN WITH',
                                  style: TextStyle(letterSpacing: 2),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        imageLogo(
                                            img: 'assets/img/icons/Google.png'),
                                        imageLogo(
                                            img:
                                                'assets/img/icons/Facebook.png'),
                                        imageLogo(
                                            img:
                                                'assets/img/icons/Twitter.png'),
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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

  Image imageLogo({required String img}) {
    return Image.asset(
      img,
      height: 30,
    );
  }
}
