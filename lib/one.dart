import 'package:flutter/material.dart';
import 'package:flutter_cor/NavigationDrawerWidget.dart';

class One extends StatefulWidget {
  const One({key}) : super(key: key);
  @override
  _oneState createState() => _oneState();
}

// ignore: camel_case_types
class _oneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("one page"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              child: Text("Back")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("tow");
              },
              child: Text("Go to tow")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("home");
              },
              child: Text("Go to home"))
        ],
      ),
    );
  }
}
