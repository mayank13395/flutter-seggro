import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes.dart';

class Language extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Language();
  }
}

enum SingingCharacter { english, hindi, sanskrit, urdu, tamil , telgu, kannad, malayali, punjabi, bhojpuri }

class _Language extends State<Language> {
  var btnColor = Color(0xdededc);
  SingingCharacter _character = SingingCharacter.english;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: _buildBody(),
      bottomNavigationBar: Container(
          color: Color.fromRGBO(237, 237, 237, 1),
          // color: Colors.,
          width: 100,
          height: 90,
          padding: EdgeInsets.all(1),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 7, // 80%
                child: Container(
                  padding: EdgeInsets.all(16),
                  // height: 100,
                  // color: Colors.red,
                  child: Text(
                      "I read and accept the terms of use and the privacy policy."),
                ),
              ),
              Expanded(
                flex: 3, // 20%
                child: Container(
                  // color: Colors.green,
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: RaisedButton(
                    // 21, 99, 51
                    color: Color.fromRGBO(21, 99, 51, 1),
                    child: Text(
                      "Accept",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                      print("Accepted"),
                       Navigator.of(context).pushReplacementNamed(Routes.login)

                      
                      
                      },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ],
          )

          // Text("I read and accept the terms of use and the privacy policy."),
          ),
    );
  }

  Material _buildBody() {
    return Material(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            // width: 900,
            // constraints: BoxConstraints.expand(),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2, // 20%
                  child: Container(
                    padding: EdgeInsets.only(left: 30, top: 50),
                    // width: 600,
                    constraints: BoxConstraints.expand(),
                    // padding: EdgeInsets.all(30),
                    // height: 100,
                    // color: Colors.red,
                    child: Text("Select Your Language",
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
                Expanded(
                  flex: 8, // 80%
                  child: Container(
                    // padding: EdgeInsets.all(16),
                    // height: 100,
                    // color: Colors.green,
                    child: ListView(
                      // padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        // ListTile(
                        //   title: const Text('English'),
                        //   leading: Radio(
                        //     value: SingingCharacter.lafayette,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         print("selected");
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                       ListTile(
                          leading: Radio(
                            value: SingingCharacter.english,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                print("selected");
                                print(_character);
                              });
                            },
                          ),
                          title: const Text('English'),
                        ),
                         ListTile(
                          title: const Text('Hindi'),
                          leading: Radio(
                           value: SingingCharacter.hindi,
                            groupValue: _character,

                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('Sanskrit'),
                          leading: Radio(
                            value: SingingCharacter.kannad,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.punjabi,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.tamil,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.telgu,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.urdu,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.malayali,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.bhojpuri,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),
                         ListTile(
                          title: const Text('English'),
                          leading: Radio(
                            value: SingingCharacter.sanskrit,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                                 print("selected");
                                print(_character);
                              });
                            },
                          ),
                        ),

                        //  ListTile(
                        //   title: const Text('English'),
                        //   leading: Radio(
                        //     value: SingingCharacter.lafayette,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        //  ListTile(
                        //   title: const Text('English'),
                        //   leading: Radio(
                        //     value: SingingCharacter.lafayette,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        //  ListTile(
                        //   title: const Text('English'),
                        //   leading: Radio(
                        //     value: SingingCharacter.lafayette,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        //  ListTile(
                        //   title: const Text('English'),
                        //   leading: Radio(
                        //     value: SingingCharacter.lafayette,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        //  ListTile(
                        //   title: const Text('English'),
                        //   leading: Radio(
                        //     value: SingingCharacter.lafayette,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
