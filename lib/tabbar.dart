import 'package:flutter/material.dart';
import 'package:my_app/screens/cart.dart';
import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/recommend.dart';
import 'package:my_app/screens/user.dart';
import 'package:my_app/widgets/SlideTransitionX.dart';

class TabbarPage extends StatefulWidget {
  TabbarPage({Key key}) : super(key: key);

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  // 当前页面index
  int oldKey = 4;
  int currentKey = 4;
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
                  oldKey = currentKey;
                  currentKey = key;
                });
              } else {
                return;
              }
            },
          )),
      body: GestureDetector(
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            child: pages[currentKey],
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransitionX(
                child: child,
                direction: oldKey < currentKey
                    ? AxisDirection.left
                    : AxisDirection.right, //上入下出
                position: animation,
              );
            }),
        onPanDown: (DragDownDetails e) {
          setState(() {
            _left = 0.0;
          });
        },
        onPanUpdate: (DragUpdateDetails e) {
          setState(() {
            _left += e.delta.dx;
          });
        },
        onPanEnd: (DragEndDetails e) {
          if (_left > 100 && currentKey > 0) {
            setState(() {
              oldKey = currentKey;
              currentKey = currentKey - (currentKey == 3 ? 2 : 1);
            });
          }
          if (_left < -100 && currentKey < 4) {
            setState(() {
              oldKey = currentKey;
              currentKey = currentKey + (currentKey == 1 ? 2 : 1);
            });
          }
        },
      ),
    );
  }
}
