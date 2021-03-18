import 'package:flutter/material.dart';
import 'package:my_app/widgets/Box.dart';
import 'package:my_app/widgets/Button.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final list = [
    {"name": "待支付", "icon": Icons.grid_view},
    {"name": "待发货", "icon": Icons.grid_view},
    {"name": "待收货", "icon": Icons.grid_view},
    {"name": "售后/退款", "icon": Icons.grid_view},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                        ),
                        Text(
                          '用户名',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ABCDEFGHHH',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: null,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
            ),
            MyBox(
              title: '我的订单',
              children: list
                  .map(
                    (e) => MyButton(
                      text: e['name'],
                      icon: e['icon'],
                      color: Colors.black87,
                      onTap: () => {
                        print(e['name']),
                      },
                    ),
                  )
                  .toList(),
            ),
            MyBox(
              title: '我的订单',
              children: list
                  .map(
                    (e) => MyButton(
                      text: e['name'],
                      icon: e['icon'],
                      color: Colors.black87,
                      onTap: () => {
                        print(e['name']),
                      },
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
