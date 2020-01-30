import 'package:boilerplate/services/cropdetails.dart';
import 'package:boilerplate/services/image_result.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class Result extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Result();
  }
}

class _Result extends State<Result> {
  String plant_name;
  String isdisease;
  String disease_name;
  String soln = "Get Solution";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    plant_name = CropDetails.cropName;
    isdisease = 'false';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("dddddddddddddddddd"),
      // ),
      backgroundColor: Colors.green,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        
        Container(
           padding: EdgeInsets.only(
            top: 50,
          ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("RESULT",style: TextStyle(color: Colors.white,fontSize: 19),)


            ],
          ),
        ),


        Container(
           padding: EdgeInsets.only(
            top: 50, left: 20
          ),
                  child: Row(
          
            children: <Widget>[

               new GestureDetector(
                    onTap: ()=> {
                         Navigator.of(context).pushReplacementNamed(Routes.home)
                    },
                    child: Icon(
                                  
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                  ),
             



            
            ],
          ),
        ),








           Container(
          padding: EdgeInsets.only(top: 230, left: 20, right: 20, bottom: 120),
          child: Container(
            padding: EdgeInsets.only(top: 150,left: 20,right: 20),
            decoration: BoxDecoration(
                shape:
                    BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.0,
                  ),
                ]),
                child: !ImageResult.disease ?
                Text("Voila! Your Plant is Healthy.") :
                
                Column(
                  children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                  child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Align(
                                  
                                  alignment: Alignment.centerLeft,
                                  child: Text("Plant Name :"),
                                ),
                                Align(

                                  alignment: Alignment.centerRight,
                                  child: Text(CropDetails.cropName  != null ?CropDetails.cropName : 'Not set' ),
                            ),
                          ],
                        ),
                  ),

                   Container(
                       padding: EdgeInsets.all(10),
                  child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Disease :"),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(ImageResult.disease ? "Yes" : "No"),
                      ),
                    ],
                  ),

                  ),

                  Container(
                      padding: EdgeInsets.all(10),
                  child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Disease Name :"),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(ImageResult.disease_name !=null ? ImageResult.disease_name : 'Not set'),
                      ),
                    ],
                  ),

                  ),

                  

                  Container(
                      padding: EdgeInsets.all(10),
                    child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Solution :"),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(soln),
              ),
            ],
          ),
                  ) ,           

                     
            
                  ],
                
                ) ,
          ),
        ),


        Positioned(
          top: 150,
          left: 80,
          child: Container(
            width: 200,
            height: 150,
            color: Colors.white,
             child: CropDetails.imagePath !=null ? Image.file(  CropDetails.imagePath  ) :Text("image not available"),
          ),
        )
      ],
    );
 
  }
}

