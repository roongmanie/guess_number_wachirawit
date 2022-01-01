import 'dart:io';
import 'game.dart';
import 'game_wachirawit.dart';

void main() {
  while(true) {
    stdout.write('  Enter a maximum number to random: ');
    var max = stdin.readLineSync();
    print('');
    var n = int.tryParse(max!);
    n??=100;
    var game = Game(maxRandom: n);
    print('╔════════════════════════════════════════');
    print('║  ✪✪✪✪✪✪  GUESS THE NUMBER  ✪✪✪✪✪✪  ');
    print('╟────────────────────────────────────────');

    while(true) {
      stdout.write('║ Guess the number between 1 and $n: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if (guess == null || guess<1 || guess>n) {
        print("║ ╳ Please type only number between 1-$n");
        continue;
      }
      var result = game.doGuess(guess);
      if (result == 1) {
        print('║ ➜ $guess is TOO HIGH! ⇧⇧');
        print('╟────────────────────────────────────────');
      } else if (result == -1) {
        print('║ ➜ $guess is TOO LOW! ⇩⇩');
        print('╟────────────────────────────────────────');
      } else {
        print('║ ➜ $guess is CORRECT✔, total guesses :${game.guessCount}');
        print('╟────────────────────────────────────────');
        break;
      }
    }
    print('║      ‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒  ');
    print('║      ✪✪✪✪✪✪  THE END  ✪✪✪✪✪✪   ');
    print('║      ‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒  ');
    print('╚════════════════════════════════════════');
    print('');
    if(game.repeat()==false){
      print(" You've played : ${Game.myList.length} games");
      for(int i=0; i<Game.myList.length; i++){
        print(' ↠ Game #${i+1} :${Game.myList[i]} guesses');
      }
      break;
    }
  }
}