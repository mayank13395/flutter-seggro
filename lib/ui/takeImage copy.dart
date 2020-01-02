// import 'dart:html';

import 'package:boilerplate/services/cropdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../routes.dart';
import 'package:image_picker/image_picker.dart';

class TakeImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TakeImage();
  }
}

class _TakeImage extends State<TakeImage> {
  // File _image;
  // File

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      // _image = image;
      print(image);
    });
  }

  var background_color = Color.fromRGBO(222, 227, 224, 1);
  var background_color1 = Color.fromRGBO(80, 175, 71, 1);

  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed(Routes.home);
    // return (await showDialog(
    //   context: context,
    //   builder: (context) => new AlertDialog(
    //     title: new Text('Are you sure?'),
    //     content: new Text('Do you want to exit an App'),
    //     actions: <Widget>[
    //       new FlatButton(
    //         onPressed: () => Navigator.of(context).pop(false),
    //         child: new Text('No'),
    //       ),
    //       new FlatButton(
    //         onPressed: () => Navigator.of(context).pop(true),
    //         child: new Text('Yes'),
    //       ),
    //     ],
    //   ),
    // )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: background_color1, //or set color with: Color(0xFF0000FF)
    ));

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: Container(
                padding: EdgeInsets.only(left: 0, top: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Select Your Image",
                      style: TextStyle(color: Colors.white)),
                )),

            automaticallyImplyLeading: false, // hides leading widget
            // flexibleSpace: Container(

            //   child: Text("dgdgDDDDDDDdg",style: TextStyle(color: Colors.red),),
            // ),
            backgroundColor: background_color1,

            //  title: Image.asset('assets/images/headerresultimg.jpg', fit: BoxFit.cover),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                  color: Colors.orange,
                  child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10, top: 30),
                            child: Text("Upload Your Affected Crop Image",
                                style: TextStyle(
                                    color: background_color1, fontSize: 18)),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 0),
                            child: Text("Select Image from Camera or Gallery",
                                style: TextStyle(
                                    color: background_color1, fontSize: 15)),
                          )
                        ],
                      ))),
            ),
            Expanded(
              flex: 4,
              child: Card(
                child: Container(
                  color: Colors.green,
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                print("camera selected");
                                getImage;
                              },
                              child: Container(
                                  color: Colors.white10,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 5,
                                        child: Image.asset(
                                            "assets/images/camera.png"),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text("Camera",
                                            style: TextStyle(fontSize: 20)),
                                      )
                                    ],
                                  )),
                            )),
                        Expanded(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                print("gallery selected");
                                getImage;
                              },
                              child: Container(
                                  color: Colors.red,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 5,
                                        child: Image.asset(
                                            "assets/images/upload.png"),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text("Gallery",
                                            style: TextStyle(fontSize: 20)),
                                      )
                                    ],
                                  )),
                            ))
                      ],
                    ),
                    // child: Text("Second Block"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Image.asset(
                      "assets/images/" + CropDetails.cropName + ".png"),
                ),
                // child: Text("Third Block"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                color: Colors.blue,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Text("WEather Details.............."),
                ),

                // child: Text("Third Block"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
