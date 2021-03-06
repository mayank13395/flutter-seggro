import 'dart:io';

import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
// import 'package:boilerplate/garbage/previous_history%20copy.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/screens/account/accountsetting.dart';
import 'package:boilerplate/screens/previous_history/previous_history.dart';
import 'package:boilerplate/stores/post/post_store.dart';
// import 'package:boilerplate/ui/homebody.dart';
// import 'package:boilerplate/ui/previous_history.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../accountsetting.dart';
// import '../bottomnav.dart';
// import '../homebody.dart';
// import '../previous_history.dart';
import 'bottomnav.dart';
import 'homebody.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  // final _store = PostStore();

  final List<Widget> _children = [
    HomeBody(
      myColor: Colors.grey,
    ),

    PreviosHistory(),

    AccountSetting()


    // HomeBody(
    //   myColor: Colors.indigo,
    // ),
    // HomeBody(
    //   myColor: Colors.orange,
    // ),
  ];

   _onWillPop() {
    // exit(0);

  }

  int selectedIndex =0;

  @override
  void initState() {
    super.initState();

    print(_children);

    //get all posts
    // _store.getPosts();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("okkkkk");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
        body: _children[selectedIndex],
        bottomNavigationBar: BottomNav(
    callback: (val) => setState(() => {
        print("parent"),
        selectedIndex = val,
        print(_children[1]),
        print(val)
    }
    ),
        ),
      );
  }

  Material _buildBody() {
    return Material(
      child: Container(

        color: Colors.blueGrey,
      ),
    );
  }
}
