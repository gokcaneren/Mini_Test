

import 'question.dart';

class QuestionBank{

  int _questionCount=0;


  List<Question> _questionBank=[Question(question: 'Canada is the second-largest country in the world.', answer: true ), 
  Question(question: 'There is no railway system in Iceland.', answer: true),
  Question(question: 'There are 184 countries in the world.', answer: false),
  Question(question: 'Penguins are considered to be flightless birds.', answer: true),
  Question(question: 'Zeus is known as the king of Gods.', answer: true),
  Question(question: 'The capital of Australia is Sydney.', answer: false),
  Question(question: 'In Scotland, the unicorn is their national animal.', answer: true),
  Question(question: 'In the famous movie Harry Potter, Draco Malfoy doesn’t have a sibling. ', answer: false),
  Question(question: 'Mars is the closest planet to the Sun.', answer: false),
  Question(question: 'You cannot cry in space.',answer: true),
  Question(question: 'D and C in Washington D.C. stand for District of Columbia.', answer: true),
  Question(question: 'Vitamin C is also known by the chemical name of Ascorbic Acid', answer: true),
  Question(question: 'Steak contains more protein than a regular-sized broccoli', answer: false),
  Question(question: 'Put together, a human’s body blood vessels can circle the Earth', answer: true)
  ];


  String getQuestion(){
    return _questionBank[_questionCount].question.toString();
  }

  bool getAnswer(){
    return _questionBank[_questionCount].answer!;
  }

  void nextQuestion(){
    if(_questionCount+1<_questionBank.length){
      _questionCount++;
    }
  }

  bool isOver(){
    if(_questionCount+1>=_questionBank.length){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionCount=0;
  }

}