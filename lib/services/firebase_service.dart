
import 'dart:convert';

// firebase.auth().currentUser.uid

import 'package:boilerplate/data/plant-data/plants.dart';
import 'package:boilerplate/data/user-data/user_data.dart';
// import 'package:boilerplate/models/plant-data/plants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
// import 'dart:convert';
 class FireStoreService with ChangeNotifier {
   static String url;
   final databaseReference = Firestore.instance;
 void  addPlantData(AddPlantData data) async {
   
   String uid = UserData().getUserId();
   print("uiiid.............$uid");


  await databaseReference.collection(uid)
      .document("plant-data")
      .collection(data.cropname)
      .document("question-${DateTime.now()}") 
      
      .setData (data.tojson());


  // DocumentReference ref = await databaseReference.collection("books")
  //     .add({
  //       'title': 'Flutter in Action',
  //       'description': 'Complete Programming Guide to learn Flutter'
  //     });
  // print(ref.documentID);
}


void deletePlantData() {
  try {
    databaseReference
        .collection('books')
        .document('1')
        .delete();
  } catch (e) {
    print(e.toString());
  }
}

void updatePlantData() {

   

}
  
}