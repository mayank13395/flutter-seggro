import 'dart:io';

import 'package:boilerplate/services/cropdetails.dart';
import 'package:boilerplate/services/image_service.dart';
import 'package:boilerplate/services/weather_service.dart';
// import 'package:boilerplate/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
  File _image;
  String temp;
//  final imageService = Provider.of<ImageService>(context);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = weatherService.temperature.toStringAsFixed(1);
  }

  Future getImageFromCamera() async {
    //  final imageService = Provider.of<ImageService>(context);
    print("called");
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      print(image);
      CropDetails.imagePath = _image;
      print("ssss.............................s.sssssssssss");
      print(CropDetails.imagePath);
      print(CropDetails.cropName);
      print('e.......................................e.e.e.e');

      if (_image != null) {
        Navigator.of(context).pushReplacementNamed(Routes.imagedata);
      }
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;

      CropDetails.imagePath = _image;

      // imageService.setImagePath(_image);

      print("ssss.............................s.sssssssssss");
      print(CropDetails.imagePath);
      print(CropDetails.cropName);
      print('e.......................................e.e.e.e');

      if (_image != null) {
        Navigator.of(context).pushReplacementNamed(Routes.imagedata);
      }
    });

    // print("okkkkkk");
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
    // final imageService = Provider.of<ImageService>(context);

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
                  // color: Colors.orange,
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
              child: Container(
                // color: Colors.green,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: getImageFromCamera,
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
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green)),
                                    )
                                  ],
                                )),
                          )),
                      Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: getImageFromGallery,
                            child: Container(
                                // color: Colors.red,
                                child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child:
                                      Image.asset("assets/images/upload.png"),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text("Gallery",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green)),
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
                padding: EdgeInsets.only(bottom: 50),
                // color: Colors.blue,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                        constraints: BoxConstraints.expand(height: 300),
                        alignment: Alignment.center,
                        child: Image.asset(
                        "assets/images/weather.png",
                        fit: BoxFit.cover,
                        ),
                        )
                      ),
                 
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: <Widget>[
                           Align(
                             alignment: Alignment.centerLeft,
                             child:  Text(temp != null ?  temp   : "temp not available"),
                           ),
                            Align(
                             alignment: Alignment.centerLeft,
                             child:     Text(weatherService.date),
                           ),
                            Align(
                             alignment: Alignment.centerLeft,
                             child:  Text(weatherService.weather),
                           ),
                            //  new Text('2018 \u00a9 '),
                         
                            
                          ],
                        ),
                      )
                    ],
                  ),
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
