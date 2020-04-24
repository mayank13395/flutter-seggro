import 'package:boilerplate/models/post/crops.dart';
import 'package:boilerplate/services/cropdetails.dart';
import 'package:boilerplate/services/image_service.dart';
import 'package:boilerplate/services/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
  // var background_color = Color.fromRGBO(220, 239, 218, 1);
  var background_color2 = Color.fromRGBO(242, 240, 240, 1);
   var fontHeadingColor = Color.fromRGBO(237,	247	,236, 1);
  var background_color_top = Color.fromRGBO(67, 176, 56, 1);
  var background_color_top2 = Color.fromRGBO(67, 176, 56, 1);
  // 
  var background_color_top3 = Color.fromRGBO(57, 135, 50, 1);

  var background_color_top4 = Color.fromRGBO(242, 240, 240, 1);

  bool isExpanded = true;

   FocusNode _focusNode;
  TextEditingController _textFieldController;

ScrollController _scrollController;
Color _theme ;
  //  45, 110, 38
  //  #F9FBFA
  	// 237	247	236 
  var cropName = '';
  // #50AF47
  @override
  void initState() {
    super.initState();
    _theme = Colors.black;

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      // Print
      if (_focusNode.hasFocus) _textFieldController.clear();
    });


    // _scrollController = ScrollController()
    //   ..addListener(
      //   () => _isAppBarExpanded ?
      //       _theme != Colors.white ?
      //   setState(
      //     () {
      //       _theme = Colors.white;
      //       isExpanded = false;
      //       print( 'setState is called top');
      //     },
      //   ):{}
      //       : _theme != Colors.black ?
      //   setState((){
      //     isExpanded = true;
      //     print('setState is calledff botom');
      //     _theme = Colors.black;
      //   }):{},

      // );
  }
 bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (90 - kToolbarHeight);
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  // _HomeBodyState(this.myColor);

  @override
  Widget build(BuildContext context) {

    final   List<Crop> _cropList = [

  // Crop(name: Translations.of(context).text('txt_tomato') , imageUrl: "null"),
  Crop(name: Translations.of(context).text('txt_tomato'), imageUrl: "assets/images/tomato.png"),
  Crop(name:Translations.of(context).text('txt_potato') , imageUrl: "assets/images/potato.png"),
  Crop(name: Translations.of(context).text('txt_capsicum'), imageUrl: "assets/images/capsicum.jpg"),
  Crop(name: Translations.of(context).text('txt_corn'), imageUrl: "assets/images/corn.png"),
  Crop(name: Translations.of(context).text('txt_mango'), imageUrl: "assets/images/mango.jpg"),
  Crop(name: Translations.of(context).text('txt_brinjal'), imageUrl: "assets/images/brinjal.jpg"),
  Crop(name: Translations.of(context).text('txt_cucumber'), imageUrl: "assets/images/cucumber.png"),
  Crop(name: Translations.of(context).text('txt_orange'), imageUrl: "assets/images/orange.jpg"),
  Crop(name: Translations.of(context).text('txt_apple'), imageUrl: "assets/images/apple.jpg"),
  Crop(name: Translations.of(context).text('txt_banana'), imageUrl: "assets/images/banana.jpg"),
 

  
  ];





    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: background_color_top4, //or set color with: Color(0xFF0000FF)
    ));

    // FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);

    // )
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(150),
      //   child: 
        
        
      //   Container(
      //     height: 200,
      //     padding: EdgeInsets.only(top: 40,right:15,left:15,bottom: 10),
        
      //       color: background_color2,
           
      //          child: Column(
      //            mainAxisAlignment: MainAxisAlignment.start,
      //             children: <Widget>[
                   
      //              Container(
      //                 // color: Colors.red,
      //                 padding: EdgeInsets.only(bottom: 20,right: 30),
      //                 margin: const EdgeInsets.only(left: 10.0),
      //                 child: Align(
      //                   alignment: Alignment.centerLeft,
      //                                         child: Text(
      //                     "Select a Crop",
      //                     style: TextStyle( fontSize: 22,fontWeight: FontWeight.bold),
      //                   ),
      //                 ),
      //               ),
                   
      //               Container(
      //                 height: 50,
      //                 child: new TextFormField(
      //                   focusNode: _focusNode,
      //                       decoration: new InputDecoration(
      //                         contentPadding: EdgeInsets.all(10.0),
      //                           prefixIcon: Icon(Icons.search),
      //                           border: new OutlineInputBorder(
      //                             borderRadius: const BorderRadius.all(
      //                               const Radius.circular(25.0),
      //                             ),
      //                           ),
      //                           filled: true,
      //                           hintStyle: new TextStyle(color: Colors.grey[800]),
      //                           hintText: "Search Your Crop.....",
      //                           fillColor: Colors.white70),
      //                            textAlignVertical: TextAlignVertical.center,
      //                     ),
      //               ),
                 
                 
               
                 
      //             ]
      //          ),
              
                
      //       ),
     
     
      // ),

     
     
      body: _buildBody(_cropList),
      //  Container(
      //   color: Colors.grey,
      // ),
    );

    // Container(
    //   color: widget.myColor,

    // );
  }

  Material _buildBody(data) {
    //  final imageService = Provider.of<ImageService>(context);

    return Material(
      
      // color: background_color,
      child: 
      CustomScrollView(
        //  controller: _scrollController,
        slivers: <Widget>[
          ///First sliver is the App Bar
          SliverAppBar(
            ///Properties of app bar
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            expandedHeight: 200.0,

            bottom: PreferredSize(                       // Add this code
                preferredSize: Size.fromHeight(95.0),      // Add this code
                child: Text(''),                           // Add this code
              ),  

            ///Properties of the App Bar when it is expanded
            flexibleSpace:  Container(
          height: 150,
          padding: EdgeInsets.only(top: 40,right:15,left:15,bottom: 10),
        
            color: background_color2,
           
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                   
                   Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(bottom: isExpanded? 20 : 0,right: 30, top: isExpanded? 0 : 5),
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          "Select a Crop",
                          style: TextStyle( fontSize: 22,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                   

                  

                    Visibility(
                      visible: isExpanded,
                        child: Container(
                        height: 50,
                        child: new TextField(
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                  prefixIcon: Icon(Icons.search),
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: new TextStyle(color: Colors.grey[800]),
                                  hintText: "Search Your Crop.....",
                                  fillColor: Colors.white70),
                                   textAlignVertical: TextAlignVertical.center,
                            ),
                      ),
                    ) ,
                 
                 
               
                 
                  ]
               ),
              
                
            ),
     
            
            //  FlexibleSpaceBar(
            //   centerTitle: true,
            //   title: 
              
              // Text(
              //   "SliverGrid Widget",
              //   style: TextStyle(
              //       color: Colors.black87,
              //       fontSize: 20.0,
              //       fontWeight: FontWeight.bold,
              //       // fontFamily: Utils.ubuntuRegularFont),
              // ),
              // ),
            
              // background: Container(
              //   decoration: BoxDecoration(
              //     border: Border(
              //       top: BorderSide(
              //         color: Colors.black26,
              //         width: 1.0,
              //       ),
              //     ),
              //   ),
              // ),
            // ),
          ),



          SliverGrid(
           
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              ///no.of items in the horizontal axis
              crossAxisCount: 2,
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
            ),
            ///Lazy building of list
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int i) {
                /// To convert this infinite list to a list with "n" no of items,
                /// uncomment the following line:
                 if (i > 9) return null;

                 if(i.isOdd) {
                   return listItem(data[i].name, data[i].imageUrl,10.0);
                 }else {
                   return listItem(data[i].name, data[i].imageUrl,0.0);

                 }


                
              },
              /// Set childCount to limit no.of items
               childCount: 10,
            ),
          )
        ],
      ),
      
      
      
      
      
      // CustomScrollView(
      //   primary: false,
      //   slivers: <Widget>[
          











          // SliverPadding(
          //   padding: const EdgeInsets.all(20),
        //     sliver: SliverGrid.count(
        //       crossAxisSpacing: 10,
        //       mainAxisSpacing: 10,
        //       crossAxisCount: 2,
        //       children: <Widget>[
        //         Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   // boxShadow: [BoxShadow(
        //   //   color: Colors.white,
        //   //  // blurRadius: 1.0,
        //   // ),]
        // ),
               
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 cropName = "tomato";
        //                 print("item-selected" + cropName);

        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/tomato.png"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Tomato",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "potato";
        //                 //  CropDetails.cropName = cropName;
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // color: Colors.brown,
        //                     padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/potato.png"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Potato",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "capsicum";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/capsicum.jpg"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Capsicum",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "corn";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/corn.png"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Corn",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "mango";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     padding: EdgeInsets.all(10),
        //                     child: Image.asset("assets/images/mango.jpg"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Mango",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "brinjal";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/brinjal.jpg"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Brinjal",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "cucumber";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/cucumber.png"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Cucumber",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius:5.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "orange";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     padding: EdgeInsets.all(10),
        //                     child: Image.asset("assets/images/orange.jpg"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Orange",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 0.5,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "apple";
        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/apple.jpg"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Apple",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //          Container(
        //            decoration: BoxDecoration(
        //           shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(16),
        //   boxShadow: [BoxShadow(
        //     color: Colors.white,
        //    blurRadius: 10.0,
        //   ),]
        // ),
        //           child: InkWell(
        //             onTap: () {
        //               setState(() {
        //                 print("item-selected" + cropName);
        //                 cropName = "banana";

        //                 CropDetails.cropName = cropName;
        //                 Navigator.of(context)
        //                     .pushReplacementNamed(Routes.takeimage);
        //               });
        //             },
        //             child: Column(
        //               children: <Widget>[
        //                 Expanded(
        //                   flex: 8,
        //                   child: Container(
        //                     // padding: EdgeInsets.all(2),
        //                     child: Image.asset("assets/images/banana.jpg"),
        //                   ),
        //                 ),
        //                 Expanded(
        //                     flex: 2,
        //                     child: Container(
        //                       // color: Colors.brown,
        //                       // padding: EdgeInsets.only(bottom: 3),
        //                       child: Text(
        //                         "Banana",
        //                         style: TextStyle(
        //                             fontSize: 17),
        //                       ),
        //                     ))
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
         
         
          // ),
        // ],
      // ),
    );
  }



   Widget listItem(String name, String imageUrl , double mr) => Container(
     margin: EdgeInsets.only(left: 10,top: 10, right: mr ),

    
     padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                  shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(
            color: Colors.grey,
           blurRadius: 1.0,
          ),]
        ),
               
                  child: InkWell(
                    onTap: () {
                      // setState(() {
                      //   cropName = $;
                      //   print("item-selected" + cropName);

                      //   CropDetails.cropName = cropName;
                      //   Navigator.of(context)
                      //       .pushReplacementNamed(Routes.takeimage);
                      // });
                    },
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Container(
                            // padding: EdgeInsets.all(2),
                            child: Image.asset(imageUrl),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              // color: Colors.brown,
                              // padding: EdgeInsets.only(bottom: 3),
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontSize: 17),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
}

// class FlutterStatusbarcolor {}
