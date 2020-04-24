import 'dart:wasm';

// import 'package:boilerplate/ui/firstquestion.dart';
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

  int _questionNumber = 0;

 final List<Widget> _MyQuestionsSet =[
      
      // FirstQuestion()

 ];



  // #F2F4F5
  bool isSelected = false;
  var background_color = Color.fromRGBO(242, 244, 245, 1);

  // building new list of options.....
  int _animationDuration = 200;

   Color _widgetColor = Colors.white;
   List<Color> _widgetColorarr = [Colors.white,Colors.white,Colors.white];
   List<Color> _selectedBorder = [Colors.white,Colors.white,Colors.white];
   List<Color> _selectedTextColor = [Colors.black,Colors.black,Colors.black];



   

   
  double _elevation = 0;
  List<double> _elevationarr = [0,0,0];
  Color _shadowColor = Colors.grey;

  void animate_selected_option(option) {
    setState(() {
     
     for(int i = 0; i<_elevationarr.length; i++) {
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



  List<String> getListItems(){
return ["First", "Second", "Third"];
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
              // color: _widgetColorarr[i],

                  margin: EdgeInsets.all(20),
              // width: MediaQuery.of(context).size.width*0.1 ,

                    height: 70,
              decoration: BoxDecoration(
                 border: Border.all(color: _selectedBorder[i]),
              shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
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
                   child: Center(child: Stack(
                     children:  <Widget>[
                    Center(child: Text(list[i],
                    style: TextStyle(color: _selectedTextColor[i]),
                    )),
                    // isSelected ? Icon(Icons.check_circle_outline): Container()
                    Stack(
                      children:_createChildren(),
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
      return Center(child: addIconArr[index],);
    });
  }


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
          Expanded(
            flex: 8,
            child: _MyQuestionsSet[_questionNumber]),
             Expanded(flex: 2,
          child: Column(
            children: <Widget>[

               Align(
                 alignment: Alignment.centerRight,
                                child: Container(
            width: MediaQuery.of(context).size.width*0.3 ,

            margin: EdgeInsets.only(bottom: 10,right: 20),
           child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.green)),
        color: Colors.green,
        textColor: Colors.green,
        padding: EdgeInsets.all(10.0),
        onPressed: () {},
          child: Container(
            // color: Colors.green,
            // margin: EdgeInsets.symmetric(horizontal: 40),
            
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                     Container(
                       padding: EdgeInsets.only(left:8),
                       child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 16),)),
                     Spacer(),

                     IconTheme(
                      data: IconThemeData(
                        color:Colors.white
                      ),
                       child: Icon(Icons.navigate_next)),
                        // SizedBox(width: 10),

                      ],
                    ),
          ),
        
        
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
                lineHeight: 8.0,
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