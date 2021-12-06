import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/%20crud/addproduct.dart';
import 'package:flutter_cor/home/homepage.dart';
import 'package:flutter_cor/login.dart';
import 'package:flutter_cor/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splashscreen/splashscreen.dart';

bool islogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(new MaterialApp(

      debugShowCheckedModeBanner: false,
      home: new MyApp(),
      theme: ThemeData(
          primaryColor: Color(0XFF2274A5),
          // ignore: deprecated_member_use
          buttonColor: Color(0XFF2274A5),
          textTheme: TextTheme(
              headline6: TextStyle(fontSize: 20, color: Colors.white))),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "addproduct": (context) => AddProduct(),
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      useLoader: false,
      seconds: 7,
      backgroundColor: Colors.white38,
      image: new Image.asset("images/market.gif"),
      photoSize: 220,
      navigateAfterSeconds: ForSplash(),
    );
  }
}

class ForSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return islogin == false ? Login() : HomePage();
  }
}
