import 'package:flutter/material.dart';

class PreviosHistory extends StatefulWidget {
  @override
  _PreviosHistoryState createState() => _PreviosHistoryState();
}

class _PreviosHistoryState extends State<PreviosHistory> {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset("assets/images/chocolate.jpg", fit: BoxFit.cover),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text("Item ${index}")),
            childCount: 100,
          ),
        ),
      ],
    ),
  );
}
}