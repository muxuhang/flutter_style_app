import 'package:flutter/material.dart';

// # ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    Key key,
    this.text,
    this.onTap,
    this.icon,
    this.iconSize,
    this.color,
  }) : super(key: key);
  final text;
  final onTap;
  final icon;
  final double iconSize;
  final color;
  // final Icon icon;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: (width - 80) / 4 - 5,
          width: (width - 80) / 4,
          decoration: BoxDecoration(),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: iconSize != null ? iconSize : 30,
                color: color,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: color,
                ),
              )
            ],
          ),
        ));
  }
}
