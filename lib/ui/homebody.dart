import 'package:boilerplate/services/cropdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/services.dart';

import 'package:zerker/zerker.dart';

import '../routes.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key, this.myColor}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();

  final Color myColor;
}

class _HomeBodyState extends State<HomeBody> {
  // Color myColor ;
  var background_color = Color.fromRGBO(222, 227, 224, 1);
  var background_color1 = Color.fromRGBO(80, 175, 71, 1);
  var cropName = '';
  // #50AF47
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  // _HomeBodyState(this.myColor);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: background_color1, //or set color with: Color(0xFF0000FF)
    ));
    // )
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
            backgroundColor: background_color1,
            title: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Check Your Plant Health",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Select a Crop",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                //  Text("Select a Crop",style:TextStyle(color: Colors.white,fontSize: 14),textDirection: TextDirection.ltr,)
                //  Padding(
                //    padding: EdgeInsets.only(left: 0,top: 2),
                //    child: Text("Select a Crop",style: TextStyle(color: Colors.white),),

                //  ),
              ],
            )

            //  title: Image.asset('assets/images/headerresultimg.jpg', fit: BoxFit.cover),

            ),
      ),

      body: _buildBody(),
      //  Container(
      //   color: Colors.grey,
      // ),
    );

    // Container(
    //   color: widget.myColor,

    // );
  }

  Material _buildBody() {
    return Material(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[




                Card(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                       
                        cropName = "tomato";
                         print("item-selected"+cropName);

                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);

                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Container(
                            // padding: EdgeInsets.all(2),
                            child: Image.asset("assets/images/tomato.png"),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              // color: Colors.brown,
                              // padding: EdgeInsets.only(bottom: 3),
                              child: Text(
                                "Tomato",
                                style: TextStyle(
                                    fontSize: 17, color: background_color1),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),






                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "potato";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                   
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // color: Colors.brown,
                          padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/potato.png"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Potato",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "capsicum";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                  
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/capsicum.jpg"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Capsicum",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "corn";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                  
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/corn.png"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Corn",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "mango";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                  
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/mango.jpg"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Mango",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "brinjal";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                   
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/brinjal.jpg"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Brinjal",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "cucumber";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                   
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/cucumber.png"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Cucumber",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "orange";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                   
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/orange.jpg"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Orange",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "apple";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);
                      });
                    },
                   
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/apple.jpg"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Apple",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                Card(
                   child: InkWell(
                    onTap: () {
                      setState(() {
                        print("item-selected"+cropName);
                        cropName = "banana";
                         CropDetails.cropName = cropName;
                          Navigator.of(context).pushReplacementNamed(Routes.takeimage);

                      });
                    },
                   
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          // padding: EdgeInsets.all(2),
                          child: Image.asset("assets/images/banana.jpg"),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            // color: Colors.brown,
                            // padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "Banana",
                              style: TextStyle(
                                  fontSize: 17, color: background_color1),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterStatusbarcolor {}
