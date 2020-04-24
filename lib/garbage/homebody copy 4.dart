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

   bool isFocused = false;

   FocusNode _focus = new FocusNode();

  TextEditingController _controller = new TextEditingController();

   List<Crop> _cropList = [
  Crop(name: "Tomato", imageUrl: "assets/images/tomato.png"),
  Crop(name: "Potato", imageUrl: "assets/images/potato.png"),
  Crop(name:"Capsicum", imageUrl: "assets/images/capsicum.jpg"),
  Crop(name: "Corn" , imageUrl: "assets/images/corn.png"),
  Crop(name: "Mango" , imageUrl: "assets/images/mango.jpg"),
  Crop(name: "Brinjal", imageUrl: "assets/images/brinjal.jpg"),
  Crop(name: "Cucumber", imageUrl: "assets/images/cucumber.png"),
  Crop(name: "Orange", imageUrl: "assets/images/orange.jpg"),
  Crop(name: "Apple" , imageUrl: "assets/images/apple.jpg"),
  Crop(name:"Banana" , imageUrl: "assets/images/banana.jpg"),
 
   ];

   FocusNode myFocusNode;

    FocusNode _focusNode;
    TextEditingController _textFieldController;
    ScrollController _scrollController;
    Color _theme ;
  //  45, 110, 38
  //  #F9FBFA
  	// 237	247	236 
  var cropName = '';
  bool noResultFound = false;
  // #50AF47
  @override
  void initState() {
    super.initState();
  myCopiedCropList.addAll(_cropList) ;

    _theme = Colors.black;
     myFocusNode = FocusNode();

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      // // print
      if (_focusNode.hasFocus) _textFieldController.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.clear()); 

     _focus.addListener(_onFocusChange);

    _controller.addListener(filterCrop); 
  
  }

   void _onFocusChange(){
    // debug// print("Focus: "+_focu());
    // print("okkkkk.....$isFocused");
    isFocused = ! isFocused;
    _controller.clear();
    setState(() {
  //  myCopiedCropList = _cropList;
       
    });
  }
 List<Crop> myCopiedCropList = [];



 Future<bool> _onWillPop() {
    // print("back pressed... from home page");
    // Navigator.of(context).pushReplacementNamed(Routes.takeimage);
  }

 bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (90 - kToolbarHeight);
  }


    @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }




    void filterCrop() {
   List <Crop> myTempCropList = [];
      print("mycropsssss11111111111111111111111................................${_cropList.length}");

   
   var x=  _controller.text;
  print("my input feild val......................$x");
  // print("croplist...........................$_cropList.toString()");
     _cropList.forEach((c){
    // print("my crop ....................${c.name}");
    
    if(c.name.toLowerCase().contains(x) ){
      // print("searched crops..............${c.name}");
      myTempCropList.add(c);

      print("cccccccccccccccccc................................${c.name}");

 
    }else {
      
    }

  });

    myTempCropList.forEach((f)=>{
          // print("------------------------------------------------"),

          //  print("my temp............... crop nme..............${f.name}")
        });

  setState(() {
        // isFocused = !isFocused;
        // print("Current State $State()");
        // myCopiedCropList.removeWhere( (e) => myTempCropList.contains(e));
        myCopiedCropList.clear();
        myCopiedCropList.addAll(myTempCropList);
        if(myTempCropList.isEmpty){
          noResultFound = true;
        }
        // print("ssssssssssssssssss.............updated $myCopiedCropList");
        // print("ssssssssssssssssss.............updated $myTempCropList");
        // myCopiedCropList.forEach((f)=>{
        //   print("------------------------------------------------"),
        //    print("my copied crop nme..............${f.name}")
        // });
        //  myTempCropList.forEach((f)=>{
        //   // print("------------------------------------------------"),

        //    print("my temp crop nme..............${f.name}")
        // });
      });

      print("mycropsssss................................${_cropList.length}");

    // _cropList.where((Crop) => Crop.name.toLowerCase().contains(x.toLowerCase()).toList();
  }




  // _HomeBodyState(this.myColor);

  @override
  Widget build(BuildContext context) {

  //   _cropList = [

  // // Crop(name: Translations.of(context).text('txt_tomato') , imageUrl: "null"),
  // Crop(name: Translations.of(context).text('txt_tomato'), imageUrl: "assets/images/tomato.png"),
  // Crop(name:Translations.of(context).text('txt_potato') , imageUrl: "assets/images/potato.png"),
  // Crop(name: Translations.of(context).text('txt_capsicum'), imageUrl: "assets/images/capsicum.jpg"),
  // Crop(name: Translations.of(context).text('txt_corn'), imageUrl: "assets/images/corn.png"),
  // Crop(name: Translations.of(context).text('txt_mango'), imageUrl: "assets/images/mango.jpg"),
  // Crop(name: Translations.of(context).text('txt_brinjal'), imageUrl: "assets/images/brinjal.jpg"),
  // Crop(name: Translations.of(context).text('txt_cucumber'), imageUrl: "assets/images/cucumber.png"),
  // Crop(name: Translations.of(context).text('txt_orange'), imageUrl: "assets/images/orange.jpg"),
  // Crop(name: Translations.of(context).text('txt_apple'), imageUrl: "assets/images/apple.jpg"),
  // Crop(name: Translations.of(context).text('txt_banana'), imageUrl: "assets/images/banana.jpg"),
 

  
  // ];








    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: background_color_top4, //or set color with: Color(0xFF0000FF)
    ));

    // FlutterStatusbarTextColor.setTextColor(FlutterStatusbarTextColor.dark);

    // )
    return GestureDetector(

      onTap: (){
         FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      

          child: Scaffold(
      
          body: _buildBody(),
          //  Container(
          //   color: Colors.grey,
          // ),
        ),
    );

  }

  Material _buildBody() {
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
            expandedHeight: 151.0,

            bottom: PreferredSize(                       // Add this code
                preferredSize: Size.fromHeight(95.0),      // Add this code
                child: Text(''),                           // Add this code
              ),  

            ///Properties of the App Bar when it is expanded
            flexibleSpace:  Container(
          height: 152,
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
                           focusNode: _focus,
                           controller: _controller,
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                  prefixIcon: Icon(Icons.search),
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  filled: true,
                                  hintStyle: new TextStyle(color: isFocused ? Colors.black :Colors.grey[700] ),
                                  hintText: "Search Your Crop.....",
                                  fillColor: Colors.white70),
                                   textAlignVertical: TextAlignVertical.center,
                            ),
                      ),
                    ) ,
                 
                 
               
                 
                  ]
               ),
              
                
            ),

          ),

           Visibility(
             visible: noResultFound,
             child: Opacity(
               opacity: 0.3,
               child: Text("No result found.",style: TextStyle(color:Colors.grey[100]),))
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
                   return listItem(myCopiedCropList[i].name, myCopiedCropList[i].imageUrl,10.0);
                 }else {
                   return listItem(myCopiedCropList[i].name, myCopiedCropList[i].imageUrl,0.0);

                 }


                
              },
              /// Set childCount to limit no.of items
               childCount: myCopiedCropList.length,
            ),
          )
        ],
      ),
      
      

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
                     splashColor: Colors.lightGreenAccent,
                    onTap: () {
                      // setState(() {
                      //   cropName = $;
                      //   // print("item-selected" + cropName);

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
