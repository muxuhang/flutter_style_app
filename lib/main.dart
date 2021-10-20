import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_app/routes/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mall Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Container(),
      ),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
      ],
    );
  }
}
