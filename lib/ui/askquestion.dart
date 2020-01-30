import 'package:boilerplate/services/image_result.dart';
import 'package:boilerplate/services/questions_service.dart';
import 'package:boilerplate/ui/firstquestion.dart';
import 'package:boilerplate/ui/secondquestion.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class AskQuestions extends StatefulWidget {

  @override 
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AskQuestion();
  }
  
}

class _AskQuestion extends State<AskQuestions> {

  int selectedQuestion = 0;
  var isFirstQuestion = true;
 var _question = [
  Text("Is there Yellow Part around the Spot?"),
  Text("Does the Spots on leaf look like this?"),
  ];



  void updateDiseaseName() {

    if(ImageQuestions.tempdisease == '2') {
          if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'yes'){
        ImageResult.disease_name = '';
          Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
           Navigator.of(context).pushReplacementNamed(Routes.result); 

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'no' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } 

    }else if(ImageQuestions.tempdisease == '3') {

      if(ImageQuestions.tempDiseaseTocompare == '2') {
           if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'yes'){
        ImageResult.disease_name = '';
           Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'no' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } 

      }else if(ImageQuestions.tempDiseaseTocompare == '4') {
           if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'yes'){
        ImageResult.disease_name = '';
           Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } else if(ImageQuestions.isSpot == 'no' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';
            Navigator.of(context).pushReplacementNamed(Routes.result);

      } 

      }

    }else if (ImageQuestions.tempdisease == '4') {

      if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'yes'){
        ImageResult.disease_name = '';

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';

      } else if(ImageQuestions.isSpot == 'yes' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';

      } else if(ImageQuestions.isSpot == 'no' && ImageQuestions.isYellowinsh == 'no'){
         ImageResult.disease_name = '';

      } 

    }

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: EmptyAppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: _question[selectedQuestion],

              ),
            ),
            Expanded(
              flex: 8,
              child: Card(
                elevation: 4.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    isFirstQuestion ?  FirstQuestion() : SecondQuestion(),

                      Container(
                 padding: EdgeInsets.only(
                  //  left: 20,
                    top: MediaQuery.of(context).size.height * .80,
                   ),
                 alignment: Alignment.center,
                 child:  RaisedButton(
                    // 21, 99, 51
                    color: Color.fromRGBO(21, 99, 51, 1),
                    child: Text( isFirstQuestion ? "Next" : "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                      setState(() {
                        selectedQuestion = 1;
                        isFirstQuestion = false;
                        if(selectedQuestion == 1)  {
                          
                          updateDiseaseName();

                        }




                      })
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
     
               )

                  ],

                ),
              )

            
              
              ,
            )
          ],
        ),
      ),
    );
  }


}