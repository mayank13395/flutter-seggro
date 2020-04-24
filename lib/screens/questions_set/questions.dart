import 'dart:wasm';

// import 'package:boilerplate/screens/firstquestion.dart';
// import 'package:boilerplate/screens/homebody%20copy%202.dart';
// import 'package:boilerplate/screens/previous_history%20copy.dart';
import 'package:boilerplate/data/plant-data/plants.dart';
// import 'package:boilerplate/models/plant-data/plants.dart';
import 'package:boilerplate/screens/questions_set/eight_ques.dart';
import 'package:boilerplate/screens/questions_set/fifth_ques.dart';
import 'package:boilerplate/screens/questions_set/first_ques.dart';
import 'package:boilerplate/screens/questions_set/fourth_ques.dart';
import 'package:boilerplate/screens/questions_set/nine_ques.dart';
// import 'package:boilerplate/screens/questions_set/questions%20copy%202.dart';
import 'package:boilerplate/screens/questions_set/second_ques.dart';
import 'package:boilerplate/screens/questions_set/seven_ques.dart';
import 'package:boilerplate/screens/questions_set/sixth_ques.dart';
import 'package:boilerplate/screens/questions_set/ten_ques.dart';
import 'package:boilerplate/screens/questions_set/third_ques.dart';
import 'package:boilerplate/services/firebase_service.dart';
import 'package:boilerplate/services/questions_data.dart';
import 'package:boilerplate/services/questions_service.dart';
import 'package:boilerplate/widgets/LinearProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../routes.dart';

class MyQUestions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyQuestions();
  }
}

class _MyQuestions extends State<MyQUestions>
    with SingleTickerProviderStateMixin {
  // Animation Controller..............
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();
    questionSubmitted = 1 / ((_questionsList.length).toInt());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero)
        .animate(_controller);

    _offsetFloat.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _questionNumber = 0;
  double questionSubmitted = 0;
  int elapsed = 0;
  double offset = 1;

  List<Widget> _questionsList = [
    // PreviosHistory()
    // HomeBody()

    // FirstQuestion(),
    FirstQuestion(),
    SecondQuestion(),
    ThirdQuestion(),
    FourthQuestion(),
    FifthQuestion(),
    SixthQuestion(),
    SeventhQuestion(),
    EightQuestion(),
    NinthQuestion(),
    TenthQuestion()
  ];

  Future<bool> _onWillPop() {
     Navigator.of(context).pushReplacementNamed(Routes.home);

  }

  // #F2F4F5
  bool isSelected = false;
  var background_color = Color.fromRGBO(242, 244, 245, 1);

  // building new list of options.....
  int _animationDuration = 200;

  Color _widgetColor = Colors.white;
  List<Color> _widgetColorarr = [Colors.white, Colors.white, Colors.white];
  List<Color> _selectedBorder = [Colors.white, Colors.white, Colors.white];
  List<Color> _selectedTextColor = [Colors.black, Colors.black, Colors.black];

  double _elevation = 0;
  List<double> _elevationarr = [0, 0, 0];
  Color _shadowColor = Colors.grey;

  void animate_selected_option(option) {
    setState(() {
      for (int i = 0; i < _elevationarr.length; i++) {
        _elevationarr[i] = 0;
        _widgetColorarr[i] = Colors.white;
        // addIconArr.clear();
        _selectedBorder[i] = Colors.white;
        _selectedTextColor[i] = Colors.black;

        // _selectedBorder.clear();

      }
      _elevationarr[option] = 30;
      _widgetColorarr[option] = Colors.green;
      _selectedBorder[option] = Colors.green;
      _selectedTextColor[option] = Colors.white;
      //  isSelected = true;
    });
  }

  List<String> getListItems() {
    return ["First", "Second", "Third"];
  }

  Widget getList() {
    List<String> list = getListItems();
    ListView myList = new ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              animate_selected_option(i);

              // setState(() {

              //   _elevation = 30;
              //   print("ok clicked");
              // });
            },
            child: Container(
              // color: _widgetColorarr[i],

              margin: EdgeInsets.all(20),
              // width: MediaQuery.of(context).size.width*0.1 ,

              height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: _selectedBorder[i]),
                  shape: BoxShape
                      .rectangle, // BoxShape.circle or BoxShape.retangle
                  // color: _widgetColorarr[i],
                  // borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      // color: Colors.white30,
                      blurRadius: 20.0,
                    ),
                  ]),

              child: AnimatedPhysicalModel(
                  duration: Duration(milliseconds: _animationDuration),
                  shape: BoxShape.rectangle,
                  // color: Colors.white,
                  color: _widgetColorarr[i],
                  elevation: _elevationarr[i],
                  shadowColor: _shadowColor,
                  child: Center(
                      child: Stack(
                    children: <Widget>[
                      Center(
                          child: Text(
                        list[i],
                        style: TextStyle(color: _selectedTextColor[i]),
                      )),
                      // isSelected ? Icon(Icons.check_circle_outline): Container()
                      Stack(
                        children: _createChildren(),
                      )
                    ],
                  ))),
            ),
          );
        });
    return myList;
  }

// stack list on select............
// List<String> _optionValue = ["First", "Second" , "Third" ];

  List<Widget> addIconArr = [
    // Text(_optionValue),
    // IconTheme(
    //   data: IconThemeData(
    //     color:Colors.green
    //   ),
    //     child: Icon(Icons.check_circle_outline)),
  ];
  List<Widget> _createChildren() {
    return new List<Widget>.generate(addIconArr.length, (int index) {
      return Center(
        child: addIconArr[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.white, // navigation bar color
  // statusBarColor: Colors.pink, // status bar color
));
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
          child: Scaffold(
          // backgroundColor: background_color,
          body: _buildQuestions()
          // body:  _questionsList[0],
          // _children
          // body: HomeBody(),
          ),
    );
  }

  Widget _buildQuestions() {
    final fireStoreService = Provider.of<FireStoreService>(context, listen: false);
    return Material(
      child:

          // Container(
          //       // flex: 8,
          //       child: _questionsList[_questionNumber]
          //       ),

          Column(
        children: <Widget>[
          Expanded(
              flex: 8,
              child: Container(
                  child: AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final inAnimation = Tween<Offset>(
                                begin: Offset(offset, 0.0),
                                end: Offset(0.0, 0.0)
                                // .chain(CurveTween(curve: Curves.elasticOut))
                                )
                            .animate(animation);
                        final outAnimation = Tween<Offset>(
                                begin: Offset(-offset, 0.0),
                                end: Offset(0.0, 0.0))
                            .animate(animation);

                        if (child.key == ValueKey(_questionNumber.toString())) {
                          return ClipRect(
                            child: SlideTransition(
                              position: inAnimation,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: child,
                              ),
                            ),
                          );
                        } else {
                          print("ffff");
                          return ClipRect(
                            child: SlideTransition(
                              position: outAnimation,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: child,
                              ),
                            ),
                          );
                        }
                      },
                      duration: Duration(milliseconds: 500),
                      child: Container(
                          key: Key(_questionNumber.toString()),
                          child: _questionsList[_questionNumber])))),
          Expanded(
              flex: 2,
              child: Container(
                  // decoration: BoxDecoration(
                  //                     //  border: Border.all(color: _selectedBorder[i]),
                  //                     shape: BoxShape
                  //                         .rectangle, // BoxShape.circle or BoxShape.retangle
                  //                     // color: _widgetColorarr[i],
                  //                     // borderRadius: BorderRadius.circular(10),
                  //                     boxShadow: [
                  //                       BoxShadow(
                  //                         color: Colors.white,
                  //                         // color: Colors.white30,
                  //                         blurRadius: 50.0,
                  //                       ),
                  //                     ]
                  //                     ),
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              margin: EdgeInsets.only(bottom: 10, left: 20),
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.green)),
                color: Colors.green,
                textColor: Colors.green,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  double total_question =
                      (_questionsList.length).toDouble();

                  print("clickedddddd");
                  setState(() {
                    if (_questionNumber > 0) {
                      _questionNumber--;
                      questionSubmitted -= 1 / total_question;
                      offset = -1;
                    }
                    // questionSubmitted++;

                    // _questionNumber = 2;
                  });
                
                
                },
                child: Container(
                  decoration: BoxDecoration(
                      //  border: Border.all(color: _selectedBorder[i]),
                      shape: BoxShape
                          .rectangle, // BoxShape.circle or BoxShape.retangle
                      // color: _widgetColorarr[i],
                      // borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[300],
                          // color: Colors.white30,
                          blurRadius: 50.0,
                        ),
                      ]
                      ),
                  // color: Colors.green,
                  // margin: EdgeInsets.symmetric(horizontal: 40),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                       IconTheme(
                          data:
                              IconThemeData(color: Colors.white),
                          child: Icon(Icons.navigate_before)),
                      Spacer(),

                      Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "PREV",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),

                     
                      // SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              margin: EdgeInsets.only(bottom: 10, right: 20),
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.green)),
                color: Colors.green,
                textColor: Colors.green,
                padding: EdgeInsets.all(10.0),
                onPressed: () {
                  // fireStoreService.deleteData();
                  print("questionNumber...........$_questionNumber ${_questionsList.length}");
                  double total_question =
                     
                      (_questionsList.length).toDouble();

                         if((_questionNumber == _questionsList.length-1)&& ImageQuestions.isSelected) {
                        //  if(_questionNumber == _questionsList.length-1) {
                            print("gggggggg");
                          AddPlantData x = QuestionsData().getData();
                          print("questionDataaaaaaaaa${x.cropname}  ${x.questiondata}");
                          FireStoreService().addPlantData(x);
                            
                             Alert(
                        
                        context: context,
                         title: "YaY.You have successfully submitted the questions.",
                         style: AlertStyle(
                           backgroundColor: Colors.grey[200],

                                  animationType: AnimationType.fromTop,
                                  isCloseButton: false,
                                  // isOverlayTapDismiss: false,
                                  descStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  animationDuration: Duration(milliseconds: 500),
                                  alertBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    side: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  titleStyle: TextStyle(
                                    // color: Colors.red,
                                    fontSize: 17
                                  ),
                                ),
                          // desc: "Please Choose any one option.",
                          buttons: [
                             DialogButton(
                               width: 100,
                               height: 40,
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(61, 130, 83, 1.0),
                                Color.fromRGBO(77, 176, 109, 1.0)
                              ]),
                            )
                          ]
                          //  image: Image.asset("assets/images/img3.jpg"),
                          ).show();

                            // FireStoreService.

                          // }
                    }

                  print("clickedddddd");
                  setState(() {
                    if (_questionNumber+1 <
                            _questionsList.length  &&
                        ImageQuestions.isSelected) {
                      _questionNumber++;
                      questionSubmitted += 1 / total_question;
                      offset = 1;
                    } else if (!ImageQuestions.isSelected) {
                      Alert(
                        
                        context: context,
                         title: "Please Choose any one option.",
                         style: AlertStyle(
                           backgroundColor: Colors.grey[200],

                                  animationType: AnimationType.fromTop,
                                  isCloseButton: false,
                                  // isOverlayTapDismiss: false,
                                  descStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                                  animationDuration: Duration(milliseconds: 500),
                                  alertBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    side: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  titleStyle: TextStyle(
                                    // color: Colors.red,
                                    fontSize: 17
                                  ),
                                ),
                          // desc: "Please Choose any one option.",
                          buttons: [
                             DialogButton(
                               width: 100,
                               height: 40,
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 17),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(61, 130, 83, 1.0),
                                Color.fromRGBO(77, 176, 109, 1.0)
                              ]),
                            )
                          ]
                          //  image: Image.asset("assets/images/img3.jpg"),
                          ).show();

                    }


                    // if()

                    // fireStoreService.createRecord();
                    
                    // questionSubmitted++;

                    // _questionNumber = 2;
                  });
  
                },
                child: Container(
                  decoration: BoxDecoration(
                      //  border: Border.all(color: _selectedBorder[i]),
                      shape: BoxShape
                          .rectangle, // BoxShape.circle or BoxShape.retangle
                      // color: _widgetColorarr[i],
                      // borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[300],
                          // color: Colors.white30,
                          blurRadius: 50.0,
                        ),
                      ]),
                  // color: Colors.green,
                  // margin: EdgeInsets.symmetric(horizontal: 40),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          )),
                      Spacer(),

                      IconTheme(
                          data:
                              IconThemeData(color: Colors.white),
                          child: Icon(Icons.navigate_next)),
                      // SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(bottom:20),
                      //   padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      //              width: MediaQuery.of(context).size.width*0.25 ,

                      //            decoration: BoxDecoration(
                      //       shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(20),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.grey[300],
                      //           // color: Colors.white30,
                      //           blurRadius: 20.0,
                      //         ),
                      //       ]),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: <Widget>[
                      //          Text("NEXT",style: TextStyle(color: Colors.green),),

                      //          IconTheme(
                      //           data: IconThemeData(
                      //             color:Colors.green
                      //           ),
                      //            child: Icon(Icons.navigate_next)),

                      //           ],
                      //         )

                      //   //       FlatButton(
                      //   //   // shape: new RoundedRectangleBorder(
                      //   //   //     borderRadius: new BorderRadius.circular(18.0),
                      //   //   //     side: BorderSide(color: Colors.red)),
                      //   //   color: Colors.white,
                      //   //   textColor: Colors.red,
                      //   //   padding: EdgeInsets.all(8.0),
                      //   //   onPressed: () {},
                      //   //   child: Text(
                      //   //     "Add to Cart".toUpperCase(),
                      //   //     style: TextStyle(
                      //   //       fontSize: 14.0,
                      //   //     ),
                      //   //   ),
                      //   // ),

                      // ),
                      //   //       RaisedButton(
                      //         color: Colors.blueAccent,
                      //   child: Text("Next"),
                      //   onPressed: null,
                      //   shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                      // ),
                      Container(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10),

                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: LinearProgressBar(

                        currentValue: questionSubmitted*10,
                        size: 6,
                        maxValue: 10,
                        changeColorValue: 100,
                        changeProgressColor: Colors.green,
                        backgroundColor: Colors.white,
                        progressColor: Colors.green,
                        animatedDuration: const Duration(milliseconds: 200),
                        direction: Axis.horizontal,
                        // verticalDirection: VerticalDirection.up,
                        // displayText: '',

                          ),
                          
                          
                          // new LinearPercentIndicator(
                          //   width: MediaQuery.of(context).size.width - 50,
                          //   animation: true,
                          //   lineHeight: 8.0,
                          //   animationDuration: 170,
                          //   percent: questionSubmitted,
                          //   // center: Text("80.0%",style: TextStyle(color: Colors.white),),
                          //   linearStrokeCap: LinearStrokeCap.roundAll,
                          //   progressColor: Colors.green,
                          // ),
                        ),
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }


   Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );
}
