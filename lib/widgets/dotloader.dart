import 'dart:math';

import 'package:flutter/material.dart';

class DotLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DotLoader();
  }
}

class _DotLoader extends State<DotLoader> with SingleTickerProviderStateMixin {
  final double initialRadius = 30.0;
  double radius = 1.0;

  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =  AnimationController(vsync: this, duration: Duration(seconds: 2));

        animation_rotation = Tween<double> (
          begin: 0.0,
          end: 1.0
    
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.1,curve: Curves.linear)
          )
        );




    animation_radius_in = Tween<double>(
      begin:1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn)
        )
        );

    animation_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
                  child: Stack(
            children: <Widget>[
            Dot(
              radius: 30,
              color: Colors.green,
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(pi / 4),
                radius * sin(pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.amber,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(2 * pi / 4),
                radius * sin(2 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.deepOrange,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(3 * pi / 4),
                radius * sin(3 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.brown,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(4 * pi / 4),
                radius * sin(4 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.yellow,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(5 * pi / 4),
                radius * sin(5 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.grey,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(6 * pi / 4),
                radius * sin(6 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.green,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(7 * pi / 4),
                radius * sin(7 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.deepPurple,
              ),
            ),
            Transform.translate(
              offset: Offset(
                radius * cos(8 * pi / 4),
                radius * sin(8 * pi / 4),
              ),
              child: Dot(
                radius: 5,
                color: Colors.blue,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
          child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
           shape: BoxShape.circle
           ),
      ),
    );
  }
}
