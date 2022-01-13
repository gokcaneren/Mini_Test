import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_test/question.dart';
import 'package:mini_test/questionbank.dart';

import 'constants.dart';

void main() {
  runApp(MiniTest());
}

class MiniTest extends StatelessWidget {
  const MiniTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.amber[700],
          title: Text('True/False',
          style: GoogleFonts.lobsterTwo(
            fontSize: 21.0,
            color: Colors.black,
          )
          ),
          centerTitle: true,
        ),
        body: QuestionPage(),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  List<Widget> choices=[];

    QuestionBank test=QuestionBank();
  
  void buttonCheck(bool buttonFunc){
    if(test.isOver()==true){
      showDialog(
        context: context,
       builder: (BuildContext context){
         return AlertDialog(
           backgroundColor: Colors.amber,
           title: new Text(
             'Its Over'
           ),
           actions: [
             new FlatButton(onPressed: (){
               Navigator.of(context).pop();
               setState(() {
                 test.reset();
                 choices=[];
               });
             },
              child: new Text('Start Again'),
              )
           ],
         );
       });
    }else{setState(() {
      test.getAnswer()==buttonFunc ? choices.add(kTrueIcon) : choices.add(kFalseIcon);
      test.nextQuestion();
    });
  } }


    


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test.getQuestion(),
                style: TextStyle(
                  fontSize: 20.0,
                ),
                ),
                ),
          ),
        ),
        Wrap(
          children: choices,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(10),
                      color: Colors.green[600],
                      onPressed: (){
                        buttonCheck(true);
                      }, 
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'True',
                          style: GoogleFonts.kaushanScript(
                            fontSize: 23.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: FlatButton(
                      padding: EdgeInsets.all(10),
                      color: Colors.red[600],
                      onPressed:(){
                        buttonCheck(false);
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'False',
                          style: GoogleFonts.kaushanScript(
                            fontSize: 23.0,
                          ),
                          ),
                      ),
                     ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

              
              
            