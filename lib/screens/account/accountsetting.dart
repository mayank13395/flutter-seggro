import 'package:boilerplate/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes.dart';


class AccountSetting extends StatefulWidget {

  @override 
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AccountSetting();
  }
}

class  _AccountSetting  extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      // statusBarColor: Colors.green, //or set color with: Color(0xFF0000FF)
      //  statusBarBrightness: Brightness.light

    ));
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(color:Colors.black),),
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
      ),
      body: _buildBody(),
      backgroundColor: Colors.grey[200],
     
      
    );


   
  }


 Material  _buildBody() {
      return Material(
        child: Container(
          // width: 50,
          // height: 50,
          // padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column( 
            children: <Widget>[
               //   Container(
            //       decoration: BoxDecoration(
            // shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.blue[300],
            //     // color: Colors.white30,
            //     blurRadius: 30.0,
            //   ),
            // ]),
            //     height: 150,
            //                   child: Row(
            //       children: <Widget>[
            //                     ClipOval(
            //                       child: Icon(Icons.perm_identity),
   
            //    ),
                
                 
            //       ],
 
            //     ),
            //   ),
              Container(
                margin: EdgeInsets.only(top:50),
                  height: 50,
                          decoration: BoxDecoration(
            shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],


                  // color: Colors.white30,
                  blurRadius: 50.0,
                ),
            ]),
            child: GestureDetector(
              onTap: () {
                print("calleddddd");
                logout();
              },
                          child: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    Container(
                      child: Text("Logout",),)
                  ],
              ),
            ),

                  ),
               

             
              Container(
                  height: 50,
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
            child: GestureDetector(
              onTap: () {
                print("calleddddd");
                logout();
              },
                          child: Row(
                  children: <Widget>[
                    Icon(Icons.exit_to_app),
                    Container(
                      child: Text("Logout",),)
                  ],
              ),
            ),

                  ),
               

//               CircleAvatar(

//   radius: 20,
//   backgroundImage: Image.asset(name)
// )
              


            ],
          )
        ),

      );
    }



 
                                 

 logout() async {
    try {
      await Auth().signOut();
     Navigator.of(context).pushReplacementNamed(Routes.login);
    } catch (e) {
      print(e);
    }
  }
  
}