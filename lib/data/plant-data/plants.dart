

import 'package:flutter/foundation.dart';

class AddPlantData {

  final String cropname;
  final Map  questiondata;

  AddPlantData({@required this.cropname, @required this.questiondata});
  

  // tojson
  Map<String, dynamic> tojson()=> 
  {
    'ques1': questiondata[1],
    'ques2': questiondata[2],
    'ques3': questiondata[3],
    'ques4': questiondata[4],
    'ques5': questiondata[5],
    'ques6': questiondata[6],
    'ques7': questiondata[7],
    'ques8': questiondata[8],
    'ques9': questiondata[9],
    'ques10': questiondata[10],
    // 'ques1': questiondata[10],
    

  };
  


}

