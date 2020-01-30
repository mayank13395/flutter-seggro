import 'dart:ffi';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class  ImageService with ChangeNotifier {

  ImageService();

  String cropName ;
  File imagePath ;

  void  setCropName (String cropName) {
    this.cropName = cropName;
    notifyListeners();
  }

   void setImagePath(File imagePath ) {
     this.imagePath = imagePath;

  }


  String  getCropName() {
    return this.cropName;
  }

  File getImagePath() {
    return this.imagePath;
  }


  


  //  Future<FirebaseStorage> addImageToFirebase() async{

  //   print("firebase storage function called.........");
  //   print(this.cropName);
  //   print(this.imagePath.toString());

  //    StorageReference ref = FirebaseStorage.instance.ref().child(cropName);
  // StorageUploadTask uploadTask = ref.putFile(imagePath);
  // return await (await uploadTask.onComplete).ref.getDownloadURL();

  //   }
}