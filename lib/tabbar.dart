import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/screens/cart.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/recommend.dart';
import 'package:my_app/screens/user.dart';

class TabbarPage extends StatefulWidget {
  TabbarPage({Key key}) : super(key: key);

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  // 当前页面index
  int currentKey = 0;
  double _begin = 0.0;
  double _left = 0.0;
  // 底部菜单
  final navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.recommend), label: '推荐'),
    BottomNavigationBarItem(icon: Icon(null), label: '扫码'),
    BottomNavigationBarItem(icon: Icon(Icons.shop), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), label: '个人中心'),
  ];
  // 对应页面
  final pages = [HomePage(), RecommendPage(), '', CartPage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code_rounded),
        tooltip: '添加',
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
          data: ThemeData(
            brightness: Brightness.light,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: navItems,
            currentIndex: currentKey,
            onTap: (int key) {
              if (currentKey != key && key != 2) {
                setState(() {
                  currentKey = key;
                });
              } else {
                return;
              }
            },
          )),
      body: GestureDetector(
        child: pages[currentKey],
        onPanDown: (DragDownDetails e) {
          _begin = _left;
          print('用户手指按下: ${e.globalPosition}');
        },
        onPanUpdate: (DragUpdateDetails e) {
          setState(() {
            _left += e.delta.dx;
          });
        },
        onPanEnd: (DragEndDetails e) {
          print(
              '${_left.toString()},${_begin.toString()},${currentKey.toString()}');
          if (_left > _begin + 50 && currentKey > 0) {
            setState(() {
              currentKey = currentKey - (currentKey == 3 ? 2 : 1);
            });
          }
          if (_begin > _left + 50 && currentKey < 4) {
            print(currentKey.toString());
            currentKey = currentKey + (currentKey == 1 ? 2 : 1);
          }
        },
      ),
    );
  }
}
