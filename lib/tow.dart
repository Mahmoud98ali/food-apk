import 'package:flutter/material.dart';
import 'package:flutter_cor/NavigationDrawerWidget.dart';

class Tow extends StatefulWidget {
  const Tow({key}) : super(key: key);

  @override
  _towState createState() => _towState();
}

class _towState extends State<Tow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tow page"),),
    );
  }
}
