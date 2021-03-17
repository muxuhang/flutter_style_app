import 'package:flutter/material.dart';
import 'package:my_app/screens/user.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
        actions: [
          TextButton(
            onPressed: () => {
              print('111object'),
            },
            child: Text(
              '编辑',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Text'),
            Text(
              'demo',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(100, 255, 100, 0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('container'),
            Container(
              height: 100,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
