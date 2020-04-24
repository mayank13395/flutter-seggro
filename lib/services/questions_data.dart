import 'package:boilerplate/data/plant-data/plants.dart';
// import 'package:boilerplate/models/plant-data/plants.dart';
import 'package:flutter/widgets.dart';


class QuestionsData with ChangeNotifier {

  // QuestionsData();
  Map<int, dynamic> questionData= {};
  String cropName;

  QuestionsData._privateConstructor();

  static final QuestionsData _singleton  =   QuestionsData._privateConstructor();
  // var questionData = new Map(); 

  factory QuestionsData() {
    return _singleton;
  }

 

 void addCropName(String name) {
   this.cropName = name;
        
  }


  void addData(questionNumber, data) {

    print("my question data to add..............$data");

    // questionData.add(data);
    questionData[questionNumber] = data;
    print("my question data................$data.....$questionNumber");
    print("my map dataaaaaaaa.............$questionData");




  }



 AddPlantData getData() {
   
  // AddPlantData(this.cropName,this.questionData);
AddPlantData plantDatatoAdd = new AddPlantData(cropname: this.cropName, questiondata: this.questionData);

   return plantDatatoAdd;

  }

  getSelectedQuestionData(int n) {

    return  questionData[n];
  }

  
}