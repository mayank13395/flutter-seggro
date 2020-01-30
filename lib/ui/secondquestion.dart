import 'package:boilerplate/services/cropdetails.dart';
import 'package:boilerplate/services/questions_service.dart';
import 'package:boilerplate/ui/secondquestion.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
enum SingingCharacter { yes, no }


class SecondQuestion extends StatefulWidget {
  //  SecondQuestion({Key key, this.callback}) : super(key: key);
  


  @override 
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondQuestion();
      }

    }
    
// typedef void IntCallback(bool val);



    class _SecondQuestion   extends State<SecondQuestion>{

      SingingCharacter _character = SingingCharacter.yes;
      // String _character

      @override 
      Widget build(BuildContext context) {
    // TODO: implement build
    
    return   Column(
          children: <Widget>[
            
               Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: double.infinity),
                      child: Image.file(CropDetails.imagePath)
                    ),
    
                    // child: Text("Third Block"),
                  ),
                ),
         
           
              Expanded(
                  flex: 3,
                  child: 
               Row(
            
            children: <Widget>[
              Expanded(
                flex: 5,
                child:    ListTile(
            title: const Text('Yes'),
            leading: Radio(
              value: SingingCharacter.yes,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() { 
                   _character = value;
                  print(_character);
                  ImageQuestions.isSpot = _character as String;
                  print(ImageQuestions.isYellowinsh);
                  

                   });
              },
            ),
          ),
         
              ),
                 Expanded(
                flex: 5,
                child:  ListTile(
            
            title: const Text('No'),
            leading: Radio(
              value: SingingCharacter.no,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                   _character = value;
                  print(_character);
                  ImageQuestions.isSpot = _character as String;
                  print(ImageQuestions.isYellowinsh);
                   });
              },
            ),
          ),
              ),
            ],
          ),
       
                  ),
         
                    ],
               
        );
      }
  }



