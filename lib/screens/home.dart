import 'package:flutter/material.dart';
import 'package:my_app/screens/user.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserPage();
              }))
            },
            child: Text('跳转'),
          ),
        ],
      ),
    ));
  }
}
