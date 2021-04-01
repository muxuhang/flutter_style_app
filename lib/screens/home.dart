import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/screens/home/List.dart';
import 'package:my_app/screens/home/ListItem.dart';
import 'package:my_app/screens/home/Search.dart';
import 'package:my_app/screens/home/Swiper.dart';
import 'package:my_app/utils/network.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  final list = [
    {'name': 'aaa', 'img': 'images/image1.jpeg'},
    {'name': 'aaa', 'img': 'images/image2.jpeg'},
    {'name': 'aaa', 'img': 'images/image3.jpeg'},
    {'name': 'aaa', 'img': 'images/image4.jpeg'},
    {'name': 'aaa', 'img': 'images/image5.jpeg'},
    {'name': 'aaa', 'img': 'images/image6.jpeg'},
    {'name': 'aaa', 'img': 'images/image7.jpeg'},
    {'name': 'aaa', 'img': 'images/image8.jpeg'},
  ];
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            HomeList(
              renderItem: (item, index) =>
                  HomeListItem(item: item, index: index),
              list: widget.list,
              renderHeadContainer: Column(
                children: [
                  HomeSwiper(),
                ],
              ),
              spacing: 10,
              padding: EdgeInsets.only(top: 60),
            ),
            Positioned(
              child: TextButton(
                child: Text('http测试'),
                onPressed: () => {
                  netWork(
                    method: 'post',
                    api: '/users/',
                    callBack: (res) => {
                      print(res),
                    },
                  )
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
