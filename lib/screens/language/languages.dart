import 'package:boilerplate/services/my_application.dart';
import 'package:boilerplate/services/translations.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes.dart';




// import '../routes.dart';

class Language extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Language();
  }
}

enum SingingCharacter { english, hindi, sanskrit, urdu, tamil , telgu, kannada, malayalam, marathi, punjabi, bhojpuri,gujrati }

class _Language extends State<Language> {

  // var applic;

  bool changeMyLang = false;

  // var myTextList = new List(3);

  
    String lang_title = "";
  String terms_condition = "";
  String btn_accept = "";

  


@override
  void initState() {
    
    // TODO: implement initState
    super.initState();
//  applic.onLocaleChanged(new Locale('hi',''));

    
    // APPLIC applic = new APPLIC();
    // this.applic = applic;
  }

  Future<void>  changeLang(String lang) async{
    var future = new Future.delayed(const Duration(milliseconds: 10000));
var subscription = future.asStream().listen(changeLn(lang));
// ...
subscription.cancel();
    String ln = lang;
    print("dddddd $ln");


  }

  changeLn(String ln) {
  applic.onLocaleChanged(new Locale(ln,''));

    if(ln=="hi") {
        lang_title = "अपनी भाषा चुनें";
     terms_condition = "मैं उपयोग और गोपनीयता नीति पढ़ता और स्वीकार करता हूं"; 
     btn_accept =  "स्वीकार करें";
     setState(() {
       changeMyLang = true;
     });
  
    }  else if(ln=="en") {
      setState(() {
        changeMyLang = false;
      });
    }

  //   print("sssssssssssssssss...........$l2n");

  // String z =  Translations.of(context).text('title_select_language');
  // print("qqqqqqqqqqrqqqqqfffffffffffffff............$z");
  //  lang_title = Translations.of(context).text('title_select_language');
  //    terms_condition = Translations.of(context).text('language_terms_and_condition');
  //    btn_accept = Translations.of(context).text('btn_accept');
  //    print("selected lang vaal....................$lang_title $terms_condition $btn_accept");


  // setState(() {

    
  //   //  lang_title = Translations.of(context).text('title_select_language');
  //   //  terms_condition = Translations.of(context).text('language_terms_and_condition');
  //   //  btn_accept = Translations.of(context).text('btn_accept');
  //   //  print("selected lang vaal....................$lang_title $terms_condition $btn_accept");

  //   changeMyLang = true;
  // });



  }


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
                    changeMyLang ? terms_condition :
                    // myTextList?.elementAt(1) ??
                    //  myTextList[1] !=null ? myTextList[1] :
                      "I read and accept the terms of use and the privacy policy."),
                ),
              ),
              Expanded(
                flex: 3, // 20%
                child: Container(
                  // color: Colors.green,
                  padding: EdgeInsets.only(left: changeMyLang? 0 : 20, right: 10),
                  child: RaisedButton(
                    // 21, 99, 51
                    color: Color.fromRGBO(21, 99, 51, 1),
                    child: Text(
                    // myTextList?.elementAt(2) ??
                   changeMyLang? btn_accept :

                      // myTextList[2] !=null ? myTextList[2] :
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
                    child: Text(
                    // myTextList?.elementAt(1) ??
                    changeMyLang? lang_title :

                  //  myTextList[0] !=null ? myTextList[0] :
                      "Select Your Language",
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
                       
                       ListTile(
                          leading: Radio(
                            value: SingingCharacter.english,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              // setState(() {

                                // Future.delayed(const Duration(milliseconds: 10), changeLn("en"));
                                changeLang("en");                         
                                _character = value;
                                print("selected");
                                print(_character);
                              // });
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
                              // setState(() {
                                changeLn("hi");
                              // Future.delayed(const Duration(milliseconds: 10), changeLn("hi"));
                                _character = value;
                                 print("selected");
                                print(_character);
                              // });
                            },
                          ),
                        ),
                        //  ListTile(
                        //   title: const Text('Sanskrit'),
                        //   leading: Radio(
                        //     value: SingingCharacter.kannad,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter value) {
                        //       setState(() {
                        //         _character = value;
                        //          print("selected");
                        //         print(_character);
                        //       });
                        //     },
                        //   ),
                        // ),
                         ListTile(
                          title: const Text('ગુજરાતી'),
                          leading: Radio(
                            value: SingingCharacter.gujrati,
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
                          title: const Text('ਪੰਜਾਬੀ'),
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
                          title: const Text('ಕನ್ನಡ'),
                          leading: Radio(
                            value: SingingCharacter.kannada,
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
                          title: const Text('മലയാളം'),
                          leading: Radio(
                            value: SingingCharacter.malayalam,
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
                          title: const Text('தமிழ்'),
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
                          title: const Text('తెలుగు'),
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
                          title: const Text('मराठी'),
                          leading: Radio(
                            value: SingingCharacter.marathi,
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
