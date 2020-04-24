import 'package:flutter/material.dart';
import 'dart:math' as Math;

class LinearProgressbarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;

  LinearProgressbarPainter({
    this.backgroundColor,
    @required this.foregroundColor,
    @required this.percentage,
    double strokeWidth,
  }) : this.strokeWidth = strokeWidth ?? 6;

  @override
  // void paint(Canvas canvas, Size size) {
  //   final Offset center = size.center(Offset.zero);
  //   final Size constrainedSize = size - Offset(this.strokeWidth, this.strokeWidth);
  //   final shortestSide = Math.min(constrainedSize.width, constrainedSize.height);
  //   final foregroundPaint = Paint()
  //     ..color = this.foregroundColor
  //     ..strokeWidth = this.strokeWidth
  //     ..strokeCap = StrokeCap.round
  //     ..style = PaintingStyle.stroke;
  //   final radius = (shortestSide / 2);

  //   // Start at the top. 0 radians represents the right edge
  //   final double startAngle = -(2 * Math.pi * 0.25);
  //   final double sweepAngle = (2 * Math.pi * (this.percentage ?? 0));

  //   // Don't draw the background if we don't have a background color
  //   if (this.backgroundColor != null) {
  //     final backgroundPaint = Paint()
  //       ..color = this.backgroundColor
  //       ..strokeWidth = this.strokeWidth
  //       ..style = PaintingStyle.stroke;
  //     canvas.drawCircle(center, radius, backgroundPaint);
  //   }

  //   canvas
  //   .drawArc(
  //     Rect.
  //     fromLTRB( 50.0, 50.0, 100.0, 100.0  ),
  //     // fromCircle(center: center, radius: radius),
  //     startAngle,
  //     sweepAngle,
  //     false,
  //     foregroundPaint,
  //   );
  // }


  @override
void paint(Canvas canvas, Size size) {
  final left = 50.0;
  final top = 500.0;
  final right = 300.0;
  final bottom = 470.0;
  final rect = Rect.fromLTRB(left, top, right, bottom);
  final paint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  canvas.drawRect(rect, paint);
}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as LinearProgressbarPainter);
    return oldPainter.percentage != this.percentage ||
        oldPainter.backgroundColor != this.backgroundColor ||
        oldPainter.foregroundColor != this.foregroundColor ||
        oldPainter.strokeWidth != this.strokeWidth;
  }
}