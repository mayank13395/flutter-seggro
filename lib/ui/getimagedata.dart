import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:boilerplate/services/cropdetails.dart';
import 'package:boilerplate/services/image_result.dart';
import 'package:boilerplate/services/image_service.dart';
import 'package:boilerplate/services/questions_service.dart';
import 'package:boilerplate/ui/firstquestion.dart';
import 'package:boilerplate/ui/secondquestion.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../routes.dart';
import 'dotloader.dart';

class GetImageData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GetImageData();
  }
}

class _GetImageData extends State<GetImageData> {
  var background_color = Color.fromRGBO(222, 227, 224, 1);
  var background_color1 = Color.fromRGBO(80, 175, 71, 1);

  var heading = "Loading Please wait..... ";
  var url =
      'https://us-central1-seggro-poc.cloudfunctions.net/getPrediction?image=';
  var response;

  var isSuccessful = false;

  Map<String, dynamic> user;

  var askQuestions = false;
  // var user;



  // widget questions....
   final List<Widget> _children = [
     FirstQuestion( ),
      
     SecondQuestion()
   ];


   var selectedQuestion = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addImageToFirebase()
        .then((result) => {
              print(
                  ".............................................................."),
              print("successfully uploaded image to firebase"),
              print(result),
              getImageResult(result)
            })
        .catchError(
            (e) => {print("error while uploading to firebase" + e.toString())});
  }

  Future addImageToFirebase() async {
    print("firebase storage function called.........");

    StorageReference ref =
        FirebaseStorage.instance.ref().child(CropDetails.cropName);
    StorageUploadTask uploadTask = ref.putFile(CropDetails.imagePath);
    return await (await uploadTask.onComplete).ref.getDownloadURL();
  }

  Future getImageResult(imageUrl) async {
    print("server called");
    var crp = CropDetails.cropName;
    var cropName =
        '${crp[0].toString().toUpperCase()}${crp.toString().substring(1)}';
    var updatedUrl = url + imageUrl + ".jpg&pname=" + cropName;
    print(updatedUrl);

    var response = await http.post(updatedUrl);

    // https://gardenbetty-gardenbetty.netdna-ssl.com/wp-content/uploads/2013/08/2013-08-20-01-1080x1440.jpg&pname=Potato
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var jsonString = response.body;
       user = jsonDecode(jsonString);
    
      filterResult(user);
    }
  }

  void filterResult(user1) {
    Map user = user1;
    // print(user.keys);
    print('calledddddddddddddddddddddddddd...................');
    
   





    if(CropDetails.cropName == 'tomato'){
       List  _list = user.values.toList();
    _list.removeAt(0);
    _list.sort();
    _list.sort((b, a) => a.compareTo(b));

       
         //  var updatedList1 =   _list.reversed;
    //  List updatedList = updatedList1;
    // print(updatedList);
    print(_list); 
    var isHealthy =double.parse(user['0']) ;
    print(isHealthy);
         
    if (isHealthy > 0.9) {
      print('healthyyyyyyyyyyyyyyyyyy.........................................');
      ImageResult.disease=false;
    } else {
      ImageResult.disease = true;
   
        print('Not Healthy...........................');
        user.forEach((k,v)=>{
            if(user[k]==_list[0]){
              print(k),
              print(v),

              // if(k=='0'){
              //  ImageResult.disease = 'Healthy',
              //  Navigator.of(context).pushReplacementNamed(Routes.result),
              // }


           

              if(k=='1' || k=='5') {
                print("disease 1 and 5............................................."),
                  print(k),
                   print(v),
                   if(k=='1'){
                     ImageResult.disease_name = "Leaf Curl",

                   }else if(k=='5'){
                     ImageResult.disease_name = 'Mosaic Virus',
                   },

                   Navigator.of(context).pushReplacementNamed(Routes.result),


              }
              
              else if(k=='2' || k=='3' || k=='4') {
                print("disease 2 ,  3 and 4.........................................." ),
                   print(k),
                   print(v),

                   if(k=='2') {

                     if(double.parse(user['3'])> 0.1) {
                       print('comparing with 3'),
                       ImageQuestions.tempdisease = '2',
                       ImageQuestions.tempDiseaseTocompare = '3',

                        Navigator.of(context).pushReplacementNamed(Routes.askquestion),

                     }else {
                        print('No need to compare'),
                      
                       ImageResult.disease_name = 'Bacterial Spot',
                       Navigator.of(context).pushReplacementNamed(Routes.result),

                     }

                   }
                   
                   else if(k=='3') {
                     print("in 3 ....................................."),


                     if(double.parse(user['2']) > 0.1) {
                         print('comparing with 2'),
                        ImageQuestions.tempdisease = '3',
                       ImageQuestions.tempDiseaseTocompare = '2',
                        Navigator.of(context).pushReplacementNamed(Routes.askquestion),

                     } else if(double.parse(user['4']) > 0.1) {
                        print('comparing with 4'),
                        ImageQuestions.tempdisease = '3',
                       ImageQuestions.tempDiseaseTocompare = '4',
                        Navigator.of(context).pushReplacementNamed(Routes.askquestion),

                     }else {
                       print('No matching with 2 and 4'),
              
                       ImageResult.disease_name = 'Early Blight',
                        Navigator.of(context).pushReplacementNamed(Routes.result),

                     }

                   }
                   
                   
                   else   if(k=='4') {
                           if(double.parse(user['3'])> 0.1) {
                         print('comparing with 3.......'),
                         ImageQuestions.tempdisease = '4',
                         ImageQuestions.tempDiseaseTocompare = '3',
                        Navigator.of(context).pushReplacementNamed(Routes.askquestion),

                     }else {
                        print('No need to compare'),
                      
                       ImageResult.disease_name = 'Late Blight',
                       Navigator.of(context).pushReplacementNamed(Routes.result),

                     }

                   },

    

              }


            }


        });



     
    }
      
    } 
    
    
    else if(CropDetails.cropName == 'potato') {
      print('potatotototot...................');

       List  _list = user.values.toList();
    // _list.removeAt(0);
    _list.sort();
    _list.sort((b, a) => a.compareTo(b));

      

      user.forEach((k,v)=>{

        if(user[k] == _list[0]) {
          print('potato..........................................'),
          print(k),
          print(v),
          if(k=='0') {
            print('0 is the disease..............................................'),
             ImageResult.disease = true,
           ImageResult.disease_name = 'Early Blight',
             Navigator.of(context).pushReplacementNamed(Routes.result),

          }else  if(k=='1') {
            ImageResult.disease = false,
            ImageResult.disease_name = 'Healthy',
              Navigator.of(context).pushReplacementNamed(Routes.result),
          }else  if(k=='2') {
             ImageResult.disease = true,
            ImageResult.disease_name = 'Late Blight',
              Navigator.of(context).pushReplacementNamed(Routes.result),
          }


        }

      });






      // ImageResult.disease_name = 

    }



 
  }



  void findLarget( List list) {
    // list.forEach((v)=>{
    //    v > 
    // });

  }


  Future<bool> _onWillPop() {
    print("back pressed");
    Navigator.of(context).pushReplacementNamed(Routes.takeimage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: EmptyAppBar(),
      body:  Center(
          child: isSuccessful ?
          Text("successful.....")
          :
          
          
          DotLoader(),
        ),
     
    );
    
    
    
    
    // WillPopScope(
    //   onWillPop: _onWillPop,
    //   child: Scaffold(
    //    appBar: EmptyAppBar(),
    //    body: Center(
    //        child: DotLoader(),
    //      ),
    //    )
       
       
       
       
       
    //     new Stack(
    //   children: <Widget>[
    //     // The containers in the background
    //     new Column(
    //       children: <Widget>[
    //         new Container(
    //           height: MediaQuery.of(context).size.height * .15,
    //           //  padding: EdgeInsets.only(left: 20, top: 0),
    //             child: Align(
    //               alignment: Alignment.center,
    //               child: Text(heading, style: TextStyle(color: Colors.white,fontSize: 15)
    //               ),
    //             ),
    //           color: Colors.green,
                
    //         ),
    //         new Container(
    //           height: MediaQuery.of(context).size.height * .70,
    //           color: Colors.white,
    //           child: isSuccessful ?  Center(
    //             child: LoadingBouncingGrid.circle(  
    //           ),
    //           ) : null
    //         ), 
    //       ],
    //     ),
    //     // The card widget with top padding, 
    //     // incase if you wanted bottom padding to work, 
    //     // set the `alignment` of container to Alignment.bottomCenter
             

    //     new Container(
    //       alignment: Alignment.topCenter,
    //       padding: new EdgeInsets.only(
    //           top: MediaQuery.of(context).size.height * .10,
    //           // right: 20.0,
    //           // left: 20.0
    //           ),
    //       child: isSuccessful ? 
    //        new Container(
    //         height: MediaQuery.of(context).size.height,
    //         width: MediaQuery.of(context).size.width,
    //         child: new Card(
    //           color: Colors.white,
    //           elevation: 4.0,
    //           child: askQuestions ?  
    //            FirstQuestion(callback: (val)=> setState(() {
    //              askQuestions = false;
    //            }),) : SecondQuestion()
  
    //         ),
    //       ) : 
    //       null
          
    //     ),

    //         //  Container(
    //         //      padding: EdgeInsets.only(
    //         //       //  left: 20,
    //         //         top: MediaQuery.of(context).size.height * .80,
    //         //        ),
    //         //      alignment: Alignment.center,
    //         //      child:  RaisedButton(
    //         //         // 21, 99, 51
    //         //         color: Color.fromRGBO(21, 99, 51, 1),
    //         //         child: Text(
    //         //           "Next",
    //         //           style: TextStyle(color: Colors.white),
    //         //         ),
    //         //         onPressed: () => {
    //         //           setState(() {

    //         //             selectedQuestion = 1;
    //         //           })
    //         //         },
    //         //         shape: RoundedRectangleBorder(
    //         //             borderRadius: BorderRadius.circular(30)),
    //         //       ),
     
    //         //    ),
    //   ],
    // ),
     

    //   )
      
   
     
    // );
  }
}
