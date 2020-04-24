
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:boilerplate/data/user-data/user_data.dart';
import 'package:boilerplate/models/post/http_exception.dart';
import 'package:f_logs/f_logs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// import 'package:mo';lib\models\post\http_exception.dart

class Auth with ChangeNotifier {

   String _token;
   DateTime _expiryDate;
   String _userid;


  Future<void> signUp(String email, String password) async{
    print(email);
    print(password);

      //  const _url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCGABxF8nz1YO72ti2gPoveykczC1uVi9A";
       const _url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlqwVWb0I9GkPRjWd8IwVFXFtH4V4_yN8";

// AIzaSyBlqwVWb0I9GkPRjWd8IwVFXFtH4V4_yN8
      try {
         final response = await http.post(_url, body: 
       convert.json.encode({'email': email, 'password': password,'returnSecureToken':true}));   
       print("fffffffffffffffffffffffffffffffff");
       print(convert.json.decode(response.body));

        final responseData = convert.json.decode(response.body);

        if(responseData['error'] != null) {
          print("responseeror...............................");
          print(responseData['error']);
          throw MyHttpException(responseData['error']['message']);

        }

      } catch (e) {
        print("catch error................");
        throw e;
  
      }

       // final errorMessage = e.runtimeType;
        // print(e.runtimeType == SocketException);
        // if(errorMessage == SocketException) {
          
        //   print("this is socket error.......");

        // }

   }

   
  Future<void> logIn(String email, String password) async{
    print(email);
    print(password);

       const _url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCGABxF8nz1YO72ti2gPoveykczC1uVi9A";

      //  final response = await http.post(
      //    _url,
      //     body: 
      //  convert.json.encode({'email': email, 'password': password,'returnSecureToken':true}));   
      //  print("login......................data................................");
      //  print(convert.json.decode(response.body));
      //  final responseData = convert.json.decode(response.body);


      
      try {
         final response = await http.post(_url, body: 
       convert.json.encode({'email': email, 'password': password,'returnSecureToken':true}));   
       print("fffffffffffffffffffffffffffffffff");
       print(convert.json.decode(response.body));
       var responseData =json.decode(response.body) ;
      // var x = compute(parseAuthData, response.body);
      // print("my auth dataaaaaaaaa.................$x");
      //   return compute(parseAuthData, response.body);
       var id = responseData["localId"] as String;
       var idtoken = responseData["idToken"] as String;
       print("user id.................$id $idtoken");

      //  UserData().addUserData(id, responseData["idToken"]);
      UserData().addUserData(id, idtoken);



      //  UserData.id =response.body.localId;

        // final responseData = convert.json.decode(response.body);
      //  FirebaseAuth.instance.currentUser(),

        if(responseData['error'] != null) {
          print("responseeror in login...............................");
          print(responseData['error']);
           throw MyHttpException(responseData['error']['message']);

        }

      } catch (e) {
        print("catch error in login................");
        throw e;
   
      }
       

   }

  
}