import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyQUestions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyQuestions();
  }


  
}

class _MyQuestions extends State {


  // #F2F4F5
  var background_color = Color.fromRGBO(242, 244, 245, 1);

  // building new list of options.....


  void animate_selected_option(option) {
    setState(() {
     
     for(int i = 0; i<_elevationarr.length; i++) {
       _elevationarr[i] = 0;
     }
     _elevationarr[option] = 30;


      
    });

  }

  List<String> getListItems(){
return ["Faizan", "Usman", "Naouman"];
}

  Widget getList() {
  List<String> list = getListItems();
  ListView myList = new ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, i) {
    return GestureDetector(
              onTap: (){

                animate_selected_option(i);

                // setState(() {
                
                //   _elevation = 30;
                //   print("ok clicked");
                // });
              },
                          child: Container(
                  margin: EdgeInsets.all(20),
              // width: MediaQuery.of(context).size.width*0.1 ,

                    height: 70,
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

              child: AnimatedPhysicalModel(
                  duration: Duration(milliseconds: _animationDuration),
                   shape: BoxShape.rectangle,
                    color: _widgetColor,
                    elevation: _elevationarr[i],
                    shadowColor: _shadowColor,
                   child: Center(child: Text("dfdgdgd"))),
                  ),
            );
       
    
   
  });
  return myList;
}

//    List<Widget> _getListings() {
// // List<String> list = getListItems();
// //   ListView myList = new ListView.builder(
// //     itemCount: list.length,
// //     itemBuilder: (context, index) {
// //     return new ListTile(
// //       title: new Text(list[index]),
// //     );
// //   });
// //   return myList;



//     List listings = new List<Widget>();
//     int i = 0;
//     for (i = 0; i < 3; i++) {
//       listings.add(
//             GestureDetector(
//               onTap: (){

//                 animate_selected_option(i);

//                 // setState(() {
                
//                 //   _elevation = 30;
//                 //   print("ok clicked");
//                 // });
//               },
//                           child: Container(
//                   margin: EdgeInsets.all(20),
//               // width: MediaQuery.of(context).size.width*0.1 ,

//                     height: 70,
//               decoration: BoxDecoration(
//               shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[300],
//                   // color: Colors.white30,
//                   blurRadius: 20.0,
//                 ),
//               ]),

//               child: AnimatedPhysicalModel(
//                   duration: Duration(milliseconds: _animationDuration),
//                    shape: BoxShape.rectangle,
//                     color: _widgetColor,
//                     elevation: _elevationarr[i],
//                     shadowColor: _shadowColor,
//                    child: Center(child: Text("dfdgdgd"))),
//                   ),
//             )
       
//         // RadioListTile<String>(
//         //   title: const Text('Lafayette'),
//         //   value: "c",
//         //   groupValue: "x",
//         //   onC   hanged: (_) {

//         //   },
//         // ),
      
      
//       );
//     }
//      return listings;
//   }


   int _animationDuration = 1000;

   Color _widgetColor = Colors.white;
  double _elevation = 0;
  List<double> _elevationarr = [0,0,0];
  Color _shadowColor = Colors.grey;

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: background_color,
      body: _buildQuestions()
    );
  }


  Widget _buildQuestions() {

    return Material(
      child: Column(
        children: <Widget>[
          Expanded(flex: 3,
          child: Container(
            // padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width ,
            // color: Colors.orange,
            child: Center(child: Container(
              padding: EdgeInsets.all(20),
              child: Text("Which statement describes you most? ",textAlign: TextAlign.center,style: TextStyle(color: Colors.black87,fontSize: 26),))),),
          ),

             Expanded(flex: 6,
          child: Container(
            // color: Colors.yellow,
            width: MediaQuery.of(context).size.width ,
            
            child: getList(),
            // ListView(
            //   children: _getListings(),
            // )
            
            //  Column(
            //   children: <Widget>[
            //     Container(
            // width: MediaQuery.of(context).size.width*0.85 ,

            //       height: 70,
            //        decoration: BoxDecoration(
            // shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey[300],
            //     // color: Colors.white30,
            //     blurRadius: 20.0,
            //   ),
            // ]),

            // child: Center(child: Text("dfdgdgd")),
            //     )
              

              
              
            //   ],
            // )
            
            
            ),
          ),

             Expanded(flex: 2,
          child: Column(
            children: <Widget>[

               Align(
                 alignment: Alignment.centerRight,
                                child: Container(
            width: MediaQuery.of(context).size.width*0.23 ,

            margin: EdgeInsets.only(bottom: 10,right: 20),
           child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.green)),
        color: Colors.white70,
        textColor: Colors.green,
        padding: EdgeInsets.all(8.0),
        onPressed: () {},
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 40),
            
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                     Text("NEXT",style: TextStyle(color: Colors.green),),

                     IconTheme(
                      data: IconThemeData(
                        color:Colors.green
                      ),
                       child: Icon(Icons.navigate_next)),
                        // SizedBox(width: 10),

                      ],
                    ),
          ),
        
        // Text(
        //   "Next".toUpperCase(),
        //   style: TextStyle(
        //     fontSize: 14.0,
        //   ),
        // ),
      ),
                 ),
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
            width: MediaQuery.of(context).size.width ,
            
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 15.0,
                animationDuration: 2500,
                percent: 0.8,
                // center: Text("80.0%",style: TextStyle(color: Colors.white),),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            
            ),
       
            ],
          )
           
         
          ),

        ],
      ),
      

    
    );
  }
  
}