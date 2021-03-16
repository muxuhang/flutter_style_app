import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/user.dart';

class TabbarPage extends StatefulWidget {
  TabbarPage({Key key}) : super(key: key);

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  // 当前页面index
  int currentKey = 0;
  // 底部菜单
  final navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '个人中心'),
  ];
  // 对应页面
  final pages = [HomePage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: navItems,
          currentIndex: currentKey,
          onTap: (int key) {
            if (currentKey != key) {
              setState(() {
                currentKey = key;
              });
            }
          },
        ),
        body: pages[currentKey]);
  }
}
