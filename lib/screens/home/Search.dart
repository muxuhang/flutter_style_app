import 'package:flutter/material.dart';
import 'package:my_app/widgets/OpacityButton.dart';

class HomeSearch extends StatelessWidget {
  HomeSearch({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: OpacityButton(
                onTap: () async => {
                  // await CityPickers.showCityPicker(
                  //   context: context,
                  // )
                },
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 70,
                    maxHeight: 20,
                  ),
                  child: Text(
                    '乌鲁木齐',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: OpacityButton(
              onTap: () => {},
              child: Container(
                height: 40,
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[200],
                ),
                child: Text(
                  '请输入搜索内容',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: OpacityButton(
                onTap: () => {},
                child: Icon(
                  Icons.map_sharp,
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
