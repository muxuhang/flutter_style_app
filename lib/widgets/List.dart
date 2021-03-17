import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  MyList({Key key, this.list}) : super(key: key);
  final list;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        list
            .map((item) => {
                  Container(
                    height: 10,
                    child: Text('111'),
                  )
                })
            .toList()
      ],
    );
  }
}
