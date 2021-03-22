import 'package:flutter/material.dart';
import 'package:my_app/screens/home/Search.dart';
import 'package:my_app/screens/home/Swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeSearch(),
          HomeSwiper(),
        ],
      ),
    );
  }
}
