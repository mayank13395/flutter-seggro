import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/providers/Auth.dart';
import 'package:boilerplate/routes.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:boilerplate/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  TextEditingController _confirmpasswordController = TextEditingController();

  //focus node
  FocusNode _passwordFocusNode;
  FocusNode _confirmpasswordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _store = FormStore();

  // bool isSignUp = true;
  bool isloginPage = true;
  bool isPasswordMatched = true;

  String matchPass = "";

  Map<String,String> _SignUpData = {

    'email' : '',
    'password': ''

  };

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      //this will be called whenever user types in some value
      _store.setUserId(_userEmailController.text);
      _SignUpData['email'] = _userEmailController.text;
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      _store.setPassword(_passwordController.text);
      _SignUpData['password'] = _passwordController.text;
    });

    _confirmpasswordController.addListener(() {
      // print("``````````````````````confirm pass``````````````````````");
      // print(_confirmpasswordController.text);

      if (_confirmpasswordController.text != _passwordController.text) {
        setState(() {
          isPasswordMatched = false;
        });
      } else if (_confirmpasswordController.text == _passwordController.text) {
        setState(() {
          isPasswordMatched = true;
          matchPass = "Password matched !";
        });
      }

      //this will be called whenever user types in some value
      // _store.setPassword(_passwordController.text);
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
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  Material _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(220.0)),
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

          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 80.0,
                      height: 100.0,
                      child: Image.asset("assets/icons/login-leaf.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),

          OrientationBuilder(
            builder: (context, orientation) {
              //variable to hold widget
              var child;

              //check to see whether device is in landscape or portrait
              //load widgets based on device orientation
              orientation == Orientation.landscape
                  ? child = Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: _buildLeftSide(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildRightSide(),
                        ),
                      ],
                    )
                  : child = Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(child: _buildRightSide()),
                    );

              return child;
            },
          ),

          // bottom rect.......

          Observer(
            name: 'navigate',
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : showErrorMessage(context, _store.errorStore.errorMessage);
            },
          ),
          Observer(
            name: 'loading',
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
      /* add child content here */
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/img_login.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: SizedBox(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        isloginPage ? "Login" : "Signup",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: 30.0),
              ),
              _buildUserIdField(),
              _buildPasswordField(),
              Visibility(
                  visible: !isloginPage, child: _buildConfirmPasswordField()),
              _buildForgotPasswordButton(),
              _buildSignInButton(),
              Padding(
                  padding: EdgeInsets.only(top: 10), child: _buildToggleAuth())
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: Strings.login_et_user_email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: Strings.login_et_user_password,
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
        );
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Text(
          Strings.login_btn_forgot_password,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.lightGreen),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    return RoundedButtonWidget(
      buttonText: isloginPage ? Strings.login_btn_sign_in : Strings.sign_up_btn,
      buttonColor: Colors.green,
      textColor: Colors.white,
      onPressed: () async {
        if (isloginPage) {
          if (_store.canLogin) {
            _store.login();
          } else {
            showErrorMessage(context, 'Please fill in all fields');
          }
        }else if(!isloginPage) {
          final myAuth = Provider.of<Auth>(context, listen: false);
          myAuth.signUp(_SignUpData['email'], _SignUpData['password']);
        }
        print("clicked");
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    if (message != null) {
      FlushbarHelper.createError(
        message: message,
        title: 'Error',
        duration: Duration(seconds: 3),
      )..show(context);
    }

    return Container();
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  Widget _buildToggleAuth() {
    return isloginPage
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Don't have a account?",
                      style: TextStyle(fontSize: 15),
                    )),
                InkWell(
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.green),
                  ),
                  onTap: () => {
                    setState(() {
                      isloginPage = false;
                    }),
                    print("goto Signup page..............")
                  },
                ),
              ],
            ),
          )
        : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text("Already have a account?")),
                InkWell(
                  child: Text(
                    "SignIn",
                    style: TextStyle(color: Colors.green),
                  ),
                  onTap: () => {
                    setState(() {
                      isloginPage = true;
                    }),
                    print("goto Signin page..............")
                  },
                ),
              ],
            ),
          );
  }

  Widget _buildConfirmPasswordField() {
    // return
    // Padding(
    //     padding: EdgeInsets.only(top: 15),
    //         child: TextFormField(
    // decoration: const InputDecoration(
    //     icon: Icon(Icons.lock),
    //     hintText: Strings.confirm_password,
    //     hintStyle: TextStyle(fontSize: 14.0,color: Colors.grey),
    //     // labelText: 'Name *',
    // ),
    // onSaved: (String value) {
    // This optional block of code can be used to run
    // code when the user saves the form.

    //     print("valuesssssssssssssssssss..............");
    // print(value)  ;
    //   if(_store.getPassword()== value ) {
    //     return "match successful !";
    //   }else
    //   return "don't match";
    // },
    // validator: (String value) {
    //   print("valuesssssssssssssssssss..............");

    //    if (value != _passwordController.text) {
    //             return 'Password is not matching';
    //           }
    // print(value)  ;
    //   if(_store.getPassword()== value ) {
    //     return "match successful !";
    //   }else
    //   return "don't match";

//   },
// ),
//     );

    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: Strings.confirm_password,
          // isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _confirmpasswordController,
          focusNode: _confirmpasswordFocusNode,

          errorText: isPasswordMatched ? null : "password don't matched",
        );
      },
    );
  }
}
