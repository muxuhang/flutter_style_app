import 'package:flutter/material.dart';
import 'package:my_app/widgets/OpacityButton.dart';

class HomeListItem extends StatelessWidget {
  HomeListItem({Key key, this.item, this.index}) : super(key: key);
  final item;
  final index;
  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onTap: () => {print("${item['name']}$index ")},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                offset: Offset.fromDirection(1),
                color: Colors.black12,
              )
            ],
          ),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Image(
                image: AssetImage(item['img']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
