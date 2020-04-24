import 'package:boilerplate/widgets/linearProgressBarPainter.dart';
import 'package:flutter/material.dart';

class CircleProgressBar extends StatefulWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;

  const CircleProgressBar({
    Key key,
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.value,
  }) : super(key: key);

  @override
  _CircleProgressBarState createState() => _CircleProgressBarState();
}

class _CircleProgressBarState extends State<CircleProgressBar> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.widget.backgroundColor;
    final foregroundColor = this.widget.foregroundColor;
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        child: Container(),
        foregroundPainter: LinearProgressbarPainter(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          percentage: this.widget.value,
        ),
      ),
    );
  }
}