import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/%20crud/addproduct.dart';
import 'package:flutter_cor/home/homepage.dart';
import 'package:flutter_cor/login.dart';
import 'package:flutter_cor/providers/product_provider.dart';
import 'package:flutter_cor/providers/review_cart_provider.dart';
import 'package:flutter_cor/providers/user_provider.dart';
import 'package:flutter_cor/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'ProductOverview.dart';
import 'Colors.dart';

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
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider<ProductProvider>(
      create: (context)=>ProductProvider(),),

    ChangeNotifierProvider<UserProvider>(
      create: (context)=>UserProvider(),),

    ChangeNotifierProvider<ReviewCartProvider>(
      create: (context)=>ReviewCartProvider(),),

  ],
      child:MaterialApp(

      debugShowCheckedModeBanner: false,
      home: new MyApp(),
      theme: ThemeData(

          primaryColor: prColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          textTheme: TextTheme(
              headline6: TextStyle(fontSize: 20, color: Colors.white))),
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "homepage": (context) => HomePage(),
        "addproduct": (context) => AddProduct(),
        "productOverview" :(context)=> ProductOverview(),
      })));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   SplashScreen(
        useLoader: false,
        seconds: 7,
        backgroundColor: Colors.white,
        image: new Image.asset("images/market.gif"),
        photoSize: 220,
        navigateAfterSeconds: ForSplash(),
      );

  }
}

class ForSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  islogin == false? Login():HomePage();


  }
}
