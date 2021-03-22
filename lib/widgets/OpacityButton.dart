import 'package:flutter/material.dart';

// # ignore: must_be_immutable
class OpacityButton extends StatefulWidget {
  OpacityButton({
    Key key,
    this.text,
    this.opacity,
    this.child,
    this.onTap,
  }) : super(key: key);
  final text;
  final double opacity;
  final Widget child;
  final onTap;
  // final Icon icon;
  @override
  _OpacityButtonState createState() => _OpacityButtonState();
}

class _OpacityButtonState extends State<OpacityButton> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 100),
      opacity: _opacity,
      child: GestureDetector(
        child: widget.child,
        onTap: widget.onTap,
        onTapDown: (details) {
          setState(() {
            _opacity = widget.opacity != null ? widget.opacity : 0.6;
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
