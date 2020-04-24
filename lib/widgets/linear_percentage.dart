import 'package:boilerplate/widgets/linearProgressBarPainter.dart';
import 'package:boilerplate/widgets/percent_indicator.dart';
import 'package:flutter/material.dart';

class LinearPercecentBar extends StatefulWidget {
  @override
  _LinearPercecentBarState createState() => _LinearPercecentBarState();
}

class _LinearPercecentBarState extends State<LinearPercecentBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
          body: Container(

        child: Center(
                  child: CircleProgressBar(
             foregroundColor: Colors.red,
             value: 0.5,
          ),
        ),
        
      ),
    );
  }
}