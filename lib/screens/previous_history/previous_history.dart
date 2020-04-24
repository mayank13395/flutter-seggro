import 'package:flutter/material.dart';
import 'package:boilerplate/models/previous.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class PreviosHistory extends StatefulWidget {
  @override
  _PreviosHistoryState createState() => _PreviosHistoryState();
}

class _PreviosHistoryState extends State<PreviosHistory> {
  var background_color_top2 = Color.fromRGBO(67, 176, 56, 1);
  var background_color2 = Color.fromRGBO(242, 240, 240, 1);
  var background_color_top4 = Color.fromRGBO(242, 240, 240, 1);

  List myFilterText = ["All", "Banana" , "Mango" , "Apple" , "Orange" , "Corn" , "Capsicum" , "Cucumber"];
  int filterIndex = 0;

  List<PreviousData> myCopiedPrevList = [];
  
   @override
 void initState() {
    
    myCopiedPrevList.addAll(myList);
   

  }


  List<PreviousData> myList = [
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img3.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Orange",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Tomato",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Mango",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Corn",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Capsicum",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: background_color2, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   title: Text("Your Previous Items",style: TextStyle(color:Colors.white),),
      //   backgroundColor: Colors.green,
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            ///Properties of app bar
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            expandedHeight: 100.0,

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(35.0),
              child: Text(''),
            ),

            ///Properties of the App Bar when it is expanded
            flexibleSpace: Container(
              height: 100,
              padding: EdgeInsets.only(right: 15, left: 15),
              color: background_color2,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      // color: Colors.red,
                      // padding: EdgeInsets.only(bottom: isExpanded? 20 : 0,right: 30, top: isExpanded? 0 : 5),
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Previous History",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        // decoration: new BoxDecoration(
                        //   color: Colors.white,
                        //   border: Border.all(color: Colors.black, width: 0.0),
                        //   borderRadius:
                        //       new BorderRadius.all(Radius.elliptical(150, 150)),
                        // ),
                        // color: Colors.white,
                        child: Icon(Icons.filter_list),
                        
                        // Row(
                        //   children: <Widget>[
                        //     Text(my_filter_text[filterIndex]),
                        //     InkWell(
                        //         onTap: () {
                        //           setState(() {});
                        //         },
                        //         child: Container(
                        //           //  margin: EdgeInsets.symmetric(horizontal: 20.0),
                        //           margin: EdgeInsets.only(
                        //             right: 10,
                        //           ),
                        //           child: new DropdownButton<String>(
                        //             items: <String>['All', 'Banana', 'ef', 'D']
                        //                 .map((String value) {
                        //               return new DropdownMenuItem<String>(
                        //                 value: value,
                        //                 child: new Text(value),
                        //               );
                        //             }).toList(),
                        //             onChanged: (_) {},
                        //           ),
                        //         )

                        //         // Icon(Icons.filter_list)
                        //         ),
                        //   ],
                        // )
                       
                       
                        ),
                 
                 
                 
                  ]),
            ),
          ),
          SliverStickyHeader(
  header: Container(
    height: 60.0,
    // color: Colors.lightBlue,
    color: Colors.grey[200],
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    alignment: Alignment.centerLeft,
    child: 
    
  //   new ListView.builder(itemBuilder: (context, index){
  //   return new Card(child: new Container(width: 80.0,
  //   child: new Text('Hello'),alignment: Alignment.center,));
  // }, scrollDirection: Axis.horizontal,),
    
    
    
    ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
         Row(children: <Widget>[
        Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,

                  onTap: (){
                      filterHistory("All");
                    
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('All'))),
              ))),
            ),
    Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,

                  onTap: (){
                      filterHistory('Mango');
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('Mango'))),
              ))),
            ),
    Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,
                                // splashColor: Colors.green,
                  onTap: (){
                      filterHistory('Corn');
                    
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('Corn'))),
              ))),
            ),
    Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,
                  onTap: (){
                      filterHistory('Capsicum');
                    
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('Capsicum'))),
              ))),
            ),
    Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,

                  onTap: (){
                      filterHistory('Orange');
                    
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('Orange'))),
              ))),
            ),
    Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,

                  onTap: (){
                      filterHistory('Tomato');
                    
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('Tomato'))),
              ))),
            ),
    Container(
            margin: EdgeInsets.only(right: 8,left:8),
          
            child: Container(
            
            decoration: new BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: Colors.black, width: 0.0),
            borderRadius: new BorderRadius.all(Radius.circular(20)),
            ),
              
              child: Container(
                
                child: Material(

                     shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        // side: BorderSide(color: Colors.red),
        
        ),
  clipBehavior: Clip.hardEdge,

                              child: InkWell(
                                splashColor: Colors.green,

                  onTap: (){
                      filterHistory('Banana');
                    
                  },
                  child: Container(
           

             padding: EdgeInsets.only(top:10.0,bottom: 10,left: 20,right: 20),
                    
                    child: Text('Banana'))),
              ))),
            ),
   
   
    



      ],),

      ],
    )
  ),
         sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return listItem(myCopiedPrevList[index].name, myCopiedPrevList[index].imageUrl,
                    myCopiedPrevList[index].dateTime);
              },
              childCount: myCopiedPrevList.length,
            ),
          ),
      ),
        ],
      ),
    );
  }

  Widget listItem(String name, String imageUrl, DateTime date) =>
   Container(
    height: 150,
        margin: EdgeInsets.all(10),
        //  padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                // color: Colors.white30,
                blurRadius: 20.0,
              ),
            ]),
        child: InkWell(
                                splashColor: Colors.green,

            // splashColor: Colors.lightGreenAccent,
            onTap: () {
              // setState(() {
              //   cropName = $;
              //   // // print("item-selected" + cropName);

              //   CropDetails.cropName = cropName;
              //   Navigator.of(context)
              //       .pushReplacementNamed(Routes.takeimage);
              // });
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 4,
                    child: Container(
                    
                      padding: EdgeInsets.only(left: 10,top: 2,bottom: 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(20.0),
                        //   topLeft: Radius.circular(20.0),
                        // ),
                        child: Image.asset(imageUrl),
                      ),
                    ),
                ),
                // Spacer(),
                Expanded(
                  flex: 6,
                   child: Container(
                    // margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                         Container(
                           padding: EdgeInsets.only(top: 10),
                           child: Text("26 dec")
                           )],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                  ),
                )
              ],
            )),
      );



 void filterHistory(String filterVal) {

print("filterval..................$filterVal");

   List <PreviousData> myTempPrevList = [];

     
      // print("mycropsssss11111111111111111111111................................${_cropList.length}");

   
  //  var x=  _controller.text;
  // print("my input feild val......................$x");
  // // print("croplist...........................$_cropList.toString()");
     myList.forEach((c){
    print("my previous history ....................${c.name}");
    
    if(c.name.toLowerCase().contains(filterVal.toLowerCase()) ){
      print("searched crops..............${c.name}");
      myTempPrevList.add(c);

      // print("cccccccccccccccccc................................${c.name}");

 
    }else {
      
    }

  });

  //   myTempCropList.forEach((f)=>{
  //         // // print("------------------------------------------------"),

  //         //  // print("my temp............... crop nme..............${f.name}")
  //       });

  setState(() {
        // isFocused = !isFocused;
        // // print("Current State $State()");
        // myCopiedCropList.removeWhere( (e) => myTempCropList.contains(e));
        if(filterVal == "All") {
           myCopiedPrevList.clear();

        myCopiedPrevList.addAll(myList);

        }else {
           myCopiedPrevList.clear();
        myCopiedPrevList.addAll(myTempPrevList);
        }
       
        //  if(myTempPrevList.isEmpty){
        //    print("okkk empty");
        //   // noResultFound = true;
        // }
      
      });

  }


 

}



// SliverStickyHeader(
//   header: Container(
//     height: 60.0,
//     color: Colors.lightBlue,
//     padding: EdgeInsets.symmetric(horizontal: 16.0),
//     alignment: Alignment.centerLeft,
//     child: Text(
//       'Header #0',
//       style: const TextStyle(color: Colors.white),
//     ),
//   ),
//   sliver: SliverList(
//     delegate: SliverChildBuilderDelegate(
//       (context, i) => ListTile(
//             leading: CircleAvatar(
//               child: Text('0'),
//             ),
//             title: Text('List tile #$i'),
//           ),
//       childCount: 4,
//     ),
//   ),
// );