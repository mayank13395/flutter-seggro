// // ThirdQuestion

// // import 'package:flutter/cupertino.dart';

// // ThirdQuestion

import 'package:boilerplate/services/questions_data.dart';
import 'package:boilerplate/services/questions_service.dart';
import 'package:flutter/material.dart';

class ThirdQuestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ThirdQuestion();
  }
}

class _ThirdQuestion extends State<ThirdQuestion>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();
    ImageQuestions.isSelected = false;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
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

  // List<String> imagepath = ['assets/images/img3.jpg','assets/images/img3.jpg','assets/images/img3.jpg','assets/images/img3.jpg'];

  List<List<Widget>> _myStackChild = new List.generate(
    4,
    (i) => [
      Opacity(
        opacity: 1.0,
        child: Center(
          child: Container(
            child: FittedBox(
              child: Image.asset('assets/images/img3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ],
  );

//  List<Widget> myListItem = [
//   Stack(children: ThirdQuestion[0],

// ),
//     Stack(children: <Widget>[
//     Container(
//       child:
//            FittedBox(
//                 child: Image.asset('assets/images/img3.jpg'),
//                 fit: BoxFit.fill,
//               ),
//     ),
//   ],),
//     Stack(children: <Widget>[
//     Container(
//       child:
//            FittedBox(
//                 child: Image.asset('assets/images/img3.jpg'),
//                 fit: BoxFit.fill,
//               ),
//     ),
//   ],),
//     Stack(children: <Widget>[
//     Container(
//       child:
//            FittedBox(
//                 child: Image.asset('assets/images/img3.jpg'),
//                 fit: BoxFit.fill,
//               ),
//     ),
//   ],),

// ];

// List <List<Widget>> ThirdQuestion = [

//   List<Widget> ttt =[],

// //   List<Widget> fff= [
// //  Container(
// //       child:
// //            FittedBox(
// //                 child: Image.asset('assets/images/img3.jpg'),
// //                 fit: BoxFit.fill,
// //               ),
// //     ),
// //   ]

// ];

  List<List<Widget>> getListItems() {
    return _myStackChild;
  }

  bool isSelected = false;
  var background_color = Color.fromRGBO(242, 244, 245, 1);

  // building new list of options.....
  int _animationDuration = 200;

  Color _widgetColor = Colors.white;
  List<Color> _widgetColorarr = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<Color> _selectedBorder = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<Color> _selectedTextColor = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];

  //  List<Widget> _

  double _elevation = 0;
  List<double> _elevationarr = [0, 0, 0, 0];
  Color _shadowColor = Colors.grey;

  void animate_selected_option(option, listVal) {
    setState(() {
      for (int i = 0; i < _myStackChild.length; i++) {
        _elevationarr[i] = 0;
        _widgetColorarr[i] = Colors.white;
        // addIconArr.clear();
        _selectedBorder[i] = Colors.white;
        _selectedTextColor[i] = Colors.black;

        if (_myStackChild[i].length > 1) {
          _myStackChild[i].removeLast();
          print("objectrrrrrrrrrrrrr");
        }

        // _selectedBorder.clear();

      }
      _elevationarr[option] = 30;
      _widgetColorarr[option] = Colors.green;
      _selectedBorder[option] = Colors.green;
      _selectedTextColor[option] = Colors.white;
      //  isSelected = true;
      _myStackChild[option].add(Container(
          decoration: BoxDecoration(

              // shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
              // color: _widgetColorarr[i],
              // borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[50],
                  // color: Colors.white30,
                  blurRadius: 100.0,
                ),
              ]),
          // color: Colors.green[100],
          child: Center(
              child: IconTheme(
                  data: IconThemeData(
                    size: 35,
                    // color: Colors.green
                  ),
                  child: Icon(Icons.check)))));

      ImageQuestions.isSelected = true;
    });

    switch (option) {
      case 0:
        {
          QuestionsData().addData(3, "image1Val");
        }

        break;

      case 1:
        {
          QuestionsData().addData(3, "image2Val");
        }

        break;

      case 2:
        {
          QuestionsData().addData(3, "image3Val");
        }

        break;

      case 3:
        {
          QuestionsData().addData(3, "image4Val");
        }

        break;
      default:
    }

    // expect(find.descendant(of: find.text('Tab 1'), matching: find.byType(RichText)));
    // expect(find.)
  }

  Widget getList() {
    List<List<Widget>> list = getListItems();

//   GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//   itemBuilder: (_, index) => FlutterLogo(),
//   itemCount: 4,
// )
    GridView myList = new GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              animate_selected_option(i, list[i]);

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
                color: Colors.white,

                elevation: _elevationarr[i],
                shadowColor: _shadowColor,
                child: Stack(
                  children: _myStackChild[i],

                  //   <Widget>[
                  //                      Center(child:
                  //  FittedBox(
                  //     child: Image.asset('assets/images/img3.jpg'),
                  //     fit: BoxFit.fill,
                  //   ),

                  // // Text(list[i],
                  // // style: TextStyle(color: _selectedTextColor[i]),
                  // // ),
                  // ),
                  //  ],
                ),
              ),
            ),
          );
        });
    return myList;
  }

// adding chiildren to stack of each grid item,............

//  List<Widget> _addWidget() {

//    return

//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          // Con
          Expanded(
            flex: 3,
            child: Container(
              // padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              // color: Colors.orange,
              child: Center(
                  child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Which statement describes you most? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87, fontSize: 26),
                      ))),
            ),
          ),

          Expanded(
            flex: 7,
            child: Container(
              // color: Colors.yellow,
              width: MediaQuery.of(context).size.width,

              child: getList(),
            ),
          ),
        ],
      ),
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   return Container(
//     child: Column(
//       children: <Widget>[
//         // Con
//       ],
//     ),
//   );
// }

// }

// import 'dart:async';
// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(new MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: new ThirdQuestion(),
// //   ));
// // }

// class ThirdQuestion extends StatefulWidget {
//   @override
//   ThirdQuestionState createState() => new ThirdQuestionState();
// }

// class ThirdQuestionState extends State<ThirdQuestion> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Slider Demo'),
//       ),
//       body: new Container(
//         color: Colors.blueAccent,
//         padding: new EdgeInsets.all(32.0),
//         child: new ProgressIndicatorDemo(),
//       ),
//     );
//   }
// }

// class ProgressIndicatorDemo extends StatefulWidget {

//   @override
//   _ProgressIndicatorDemoState createState() =>
//       new _ProgressIndicatorDemoState();
// }

// class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     animation = Tween(begin: 0.0, end: 1.0).animate(controller)
//       ..addListener(() {
//         setState(() {
//           // the state that has changed here is the animation object’s value
//         });
//       });
//     // controller.repeat();
//     // controller.st
//   }

//   @override
//   void dispose() {
//     controller.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Center(
//         child: new Container(
//           child:  LinearProgressIndicator( value:  animation.value,),

//         )
//     );
//   }

// }
