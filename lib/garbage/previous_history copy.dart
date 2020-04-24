import 'package:flutter/material.dart';
import 'package:boilerplate/models/previous.dart';
import 'package:flutter/services.dart';

class PreviosHistory extends StatefulWidget {
  @override
  _PreviosHistoryState createState() => _PreviosHistoryState();
}

class _PreviosHistoryState extends State<PreviosHistory> {
  var background_color_top2 = Color.fromRGBO(67, 176, 56, 1);
  var background_color2 = Color.fromRGBO(242, 240, 240, 1);
  var background_color_top4 = Color.fromRGBO(242, 240, 240, 1);

  List my_filter_text = ["All", "Date"];
  int filterIndex = 0;

  List<PreviousData> myList = [
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img3.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img1.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img7.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img3.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img4.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img5.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img6.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img7.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img8.jpg",
        dateTime: DateTime(2020)),
    PreviousData(
        name: "Banana",
        imageUrl: "assets/images/img9.jpg",
        dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img10.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img11.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img11.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img1.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img1.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img1.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img1.jpg",
    //     dateTime: DateTime(2020)),
    // PreviousData(
    //     name: "Banana",
    //     imageUrl: "assets/images/img1.jpg",
    //     dateTime: DateTime(2020)),
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
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.0),
                          borderRadius:
                              new BorderRadius.all(Radius.elliptical(150, 150)),
                        ),
                        // color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Text(my_filter_text[filterIndex]),
                            InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  //  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  margin: EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: new DropdownButton<String>(
                                    items: <String>['A', 'B', 'C', 'D']
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {},
                                  ),
                                )

                                // Icon(Icons.filter_list)
                                ),
                          ],
                        ))
                  ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return listItem(myList[index].name, myList[index].imageUrl,
                    myList[index].dateTime);
              },
              childCount: myList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(String name, String imageUrl, DateTime date) {
    var expanded = Expanded(
                flex: 3,
                              child: SizedBox(
                  width: 130,
                  // height: 130,
                                child: FittedBox(
                    fit: BoxFit.fill,

                    // color: Colors.grey,
                    // width: 200,
                    // padding: EdgeInsets.all(15),
                    // padding: EdgeInsets.only(left: 15,top:15,bottom:15),
                    child: Image.asset(imageUrl),
                    
                    // ClipRRect(
                    //   // borderRadius: BorderRadius.circular(25.0),
                    //   borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(10.0),
                    //     topLeft: Radius.circular(10.0),
                    //   ),
                    //   child: Image.asset(imageUrl),
                    // ),
                  ),
                ),
              );
    return Container(
    // color: Colors.blueAccent,
        height: 150,
        margin: EdgeInsets.only(right: 10,left: 10),
        //  padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                // color: Colors.white30,
                // blurRadius: 20.0,
              ),
            ]),
        child: Column(
          children: <Widget>[

          
                   Container(
                    //  padding: EdgeInsets.all(10),
                                        child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              expanded,
              // Spacer(),
              Container(
                  // margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[Text(name), Text("26 dec")],
                  ),
                ),
              // Spacer(),
              // Container(
              //   child: Icon(
              //     Icons.more_vert,
              //     size: 20,
              //   ),
              // )
            ],
          ),
                   ),

          FractionallySizedBox(
            widthFactor: 0.9,
            child: Divider(
              // height: 1,
              thickness: 1,
            )
            )
          ],
        ),
        
      );
  }
}
