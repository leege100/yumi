import 'dart:math';

class DisorderMnemonic {

  List<String> shuffle(List<String> originList, double leastDiffRate) {
    return originList.reversed.toList();
  }
  // int _getRandomInt(var min,var max){
  //   final random = Random();
  //   return random.nextInt((max - min).floor()) + min;
  // }
}