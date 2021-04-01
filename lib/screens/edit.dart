import 'package:flutter/material.dart';
import 'package:my_app/utils/network.dart';

class EditPage extends StatefulWidget {
  EditPage({Key key}) : super(key: key);
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    final Function getList = () => {
          netWork(
            method: 'get',
            api: '/users/?limit=10&offset=3&status=用户ddd&statusKey=name',
            callBack: (res) => {
              print(res),
            },
          ),
        };
    return Scaffold(
      appBar: AppBar(
        title: Text('~~~'),
        actions: [
          TextButton(
            onPressed: () => {
              print('编辑'),
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
            Wrap(
              children: [
                ElevatedButton(
                  onPressed: getList,
                  child: Text('查看所有'),
                ),
                ElevatedButton(
                  onPressed: () => {
                    netWork(
                      method: 'get',
                      api: '/users/605ae761526a364d933724e3',
                      callBack: (res) => {
                        if (res.success)
                          {
                            if (res.data) {print('1')} else {print('2')}
                          }
                      },
                    ),
                  },
                  child: Text('添加一条'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
