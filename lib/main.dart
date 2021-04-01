import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/screens/start.dart';
import 'package:my_app/tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: RenderPage(),
    );
  }
}

// 启动页
class RenderPage extends StatefulWidget {
  RenderPage({Key key}) : super(key: key);
  @override
  _RenderPageState createState() => _RenderPageState();
}

class _RenderPageState extends State<RenderPage> {
  bool loading = true;
  String token = '';
  @override
  void initState() {
    final timeout = const Duration(seconds: 1);
    Timer(timeout, () {
      setState(() => {loading = false});
      print(loading);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? StartPage()
          : token != ''
              ? TabbarPage()
              : LoginPage(),
    );
  }
}
