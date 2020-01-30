import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flushbar/flushbar_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _store = FormStore();

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      //this will be called whenever user types in some value
      _store.setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      _store.setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // primary: true,
      appBar: EmptyAppBar(),
      body: Wrap (
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(220.0)),
                child: Container(
                  color: Colors.yellow[700],
                  height: 70.0,
                  width: 120.0,
                ),
              ),

              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(500.0),
                  topRight: Radius.circular(400.0),
                  ),
                child: Container(
                  color: Colors.green[700],
                  height: 120.0,
                  width: 70.0,
                ),
              ),


                  ],
                ),
              ),
            ],
          )
        ],
        
      )

    );
  }

}
