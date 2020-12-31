import 'package:awesome_login_3/components/auth/LoginContent.dart';
import 'package:awesome_login_3/components/auth/SignupContent.dart';
import 'package:awesome_login_3/styles/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Login 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenType = useState('SignIn');
    final screenCtrl = usePageController();

    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.black87,
                          Colors.black,
                          Colors.black
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * .7,
                    width: size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 80.0),
                        Container(
                          width: size.width / 2,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: InkWell(
                                  child: Center(
                                    child: Text(
                                      'Sign in',
                                      style: kAuthTitleStyle.copyWith(
                                          color: screenType.value == 'SignIn'
                                              ? Colors.white
                                              : Colors.white60),
                                    ),
                                  ),
                                  onTap: () {
                                    screenCtrl.animateToPage(0,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOutExpo);
                                    screenType.value = 'SignIn';
                                  },
                                ),
                              ),
                              Container(
                                color: Colors.white54,
                                width: 2.5,
                                height: 18.0,
                              ),
                              Container(
                                child: InkWell(
                                  child: Center(
                                    child: Text(
                                      'Sign up',
                                      style: kAuthTitleStyle.copyWith(
                                          color: screenType.value == 'SignUp'
                                              ? Colors.white
                                              : Colors.white60),
                                    ),
                                  ),
                                  onTap: () {
                                    screenCtrl.animateToPage(1,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOutExpo);
                                    screenType.value = 'SignUp';
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          child: Expanded(
                            child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: screenCtrl,
                              onPageChanged: (index) {},
                              children: <Widget>[
                                LoginContent(),
                                SignupContent()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
