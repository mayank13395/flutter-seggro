
import 'dart:developer';
import 'dart:ffi';

import 'package:f_logs/f_logs.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

   String _token;
   DateTime _expiryDate;
   String _userid;


  Future<void> signUp(String email, String password) async{
    print(email);
    print(password);

       const _url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCGABxF8nz1YO72ti2gPoveykczC1uVi9A";

       final response = await http.post(_url, body: 
       convert.json.encode({'email': email, 'password': password,'returnSecureToken':true}));   
       print("fffffffffffffffffffffffffffffffff");
       print(convert.json.decode(response.body));

       
     
   }

  
}