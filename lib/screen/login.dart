import 'package:blogclub/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

int loginTap = 0;

class _LoginState extends State<Login> {
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
                          InkWell(
                            onTap: () {
                              setState(() {
                                loginTap = 0;
                              });
                            },
                            child: Text('LOGIN',
                                style: loginTap == 0
                                    ? TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)
                                    : TextStyle(
                                        color: Colors.white54, fontSize: 18)),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                loginTap = 1;
                              });
                            },
                            child: Text('SIGNUP',
                                style: loginTap == 1
                                    ? TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)
                                    : TextStyle(
                                        color: Colors.white54, fontSize: 18)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: loginTap == 0 ? login(h) : signup(h),
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

  Container login(double h) {
    return Container(
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Text('Sign in with your account'),
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
            TxtfieldPass(),
            SizedBox(
              height: h * 0.04,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              color: Colors.blue[800],
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
                TextButton(onPressed: () {}, child: Text('Reset here'))
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imageLogo(img: 'assets/img/icons/Google.png'),
                      imageLogo(img: 'assets/img/icons/Facebook.png'),
                      imageLogo(img: 'assets/img/icons/Twitter.png'),
                    ]),
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  Container signup(double h) {
    return Container(
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
              'Welcome to app',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Text('Sign up to account'),
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
            TxtfieldPass(),
            SizedBox(
              height: h * 0.02,
            ),
            TxtfieldPass(),
            SizedBox(
              height: h * 0.04,
            ),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              color: Colors.blue[800],
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {},
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Center(
              child: Text(
                'OR SIGN UP WITH',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imageLogo(img: 'assets/img/icons/Google.png'),
                      imageLogo(img: 'assets/img/icons/Facebook.png'),
                      imageLogo(img: 'assets/img/icons/Twitter.png'),
                    ]),
              ),
            ),
            SizedBox(
              height: h * 0.04,
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

class TxtfieldPass extends StatefulWidget {
  const TxtfieldPass({
    super.key,
  });

  @override
  State<TxtfieldPass> createState() => _TxtfieldPassState();
}

class _TxtfieldPassState extends State<TxtfieldPass> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isHidden,
      decoration: InputDecoration(
        labelText: 'Password',
        suffix: InkWell(
          onTap: _togglePasswordView,
          child: Text(
            _isHidden ? 'Show' : 'Hiden',
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      print(loginTap);
      _isHidden = !_isHidden;
    });
  }
}
