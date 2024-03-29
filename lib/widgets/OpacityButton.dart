import 'package:flutter/material.dart';

// # ignore: must_be_immutable
class OpacityButton extends StatefulWidget {
  OpacityButton({
    Key? key,
    this.text,
    this.opacity,
    this.child,
    this.onTap,
  }) : super(key: key);
  final text;
  final opacity;
  final child;
  final onTap;
  // final Icon icon;
  @override
  _OpacityButtonState createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 50),
      opacity: _opacity,
      child: GestureDetector(
        child: widget.child,
        onTap: widget.onTap,
        onTapDown: (details) {
          setState(() {
            _opacity = widget.opacity != null ? widget.opacity : .8;
          });
        },
        onTapCancel: () {
          setState(() {
            _opacity = 1;
          });
        },
        onTapUp: (details) {
          setState(() {
            _opacity = 1;
          });
        },
      ),
    );
  }
}
