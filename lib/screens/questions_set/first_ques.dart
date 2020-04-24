// FirstQuestion 


import 'package:boilerplate/services/questions_data.dart';
import 'package:boilerplate/services/questions_service.dart';
import 'package:flutter/material.dart';

class FirstQuestion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstQuestion();
  }

}

class _FirstQuestion  extends State<FirstQuestion> with TickerProviderStateMixin {

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

    _offsetFloat = Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset.zero)
        .animate(_controller);

    _offsetFloat.addListener((){
      setState((){});
    });

    _controller.forward();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> getListItems(){
return ["First", "Second", "Third"];
}


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

  void animate_selected_option(option,listVal) {
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

    ImageQuestions.isSelected = true;
  
      
    });

    QuestionsData().addData(1, listVal);

  }


  Widget getList() {
  List<String> list = getListItems();
  ListView myList = new ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, i) {
    return GestureDetector(
              onTap: (){

                animate_selected_option(i,list[i]);
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
                    // Stack(
                    //   children:_createChildren(),
                    // )

                     ],
                     
                    ))),
                  ),
            );
       
    
   
  });
  return myList;
}




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    
    // Center(
    //   child: Text("sfsfs"),
    // );
    
    
    // Scaffold(
    //       body: Center(
    //                   child: Material(
    //                     child: Container(
    //               child: Text("aaaaaaaaaaaaaaaaaaaa"),
    //   ),
    //         ),
    //       ),
    // );
    
    
    Container(
        child: Column(
    children: <Widget>[
      // Con
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
       
        
        ),
      ),


    ],
        ),
      );
 
 
 
  }
  
}