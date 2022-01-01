import 'dart:io';
import 'dart:math';

class Game{
  static const maxRandom = 100;
  int? _answer;
  int guessCount = 0;
  static List<int> myList = [];

  Game({int? maxRandom=100}){
    var r = Random();
    _answer = r.nextInt(maxRandom!) + 1;
  }

  int doGuess(int num){
    guessCount++;
    if (num > _answer!){
      return 1;
    }
    else if (num < _answer!){
      return -1;
    }
    else{
      return 0;
    }
  }
  bool repeat(){
    while(true) {
      myList.add(guessCount);
      stdout.write(' Play Again? (Y/N) : ');
      String? input2 = stdin.readLineSync();

      if(input2 == 'y' || input2 == 'Y') {
        return true;
      }else if(input2 == 'n' || input2 == 'N'){
        return false;
      }
    }
  }
}

