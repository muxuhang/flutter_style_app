import 'package:flutter/material.dart';
import 'package:my_app/utils/network.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Function getList = () => {};
    return Scaffold(
      body: Container(
        child: Text('登录'),
      ),
    );
  }
}
