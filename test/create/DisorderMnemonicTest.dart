
import 'package:yumi/src/com/yumi/wallet/create/disorder_mnemonic.dart';
import 'package:test/test.dart';

void main() {

  group('shuffle', () {
    DisorderMnemonic disorderMnemonic = DisorderMnemonic();
    List<String> originList = ["when", "I", "was", "young", "I", "would", "like",
      "listen", "to", "the", "radio", "waiting"];

    test('Disorder result list size should be the same size with origin list', () {
      var resultList = disorderMnemonic.shuffle(originList, 0.5);
      expect(originList.length, resultList.length);
    });

    test('Disorder result list should not be the same item with origin list', () {
      var resultList = disorderMnemonic.shuffle(originList, 0.5);
      bool isSame = true;
      for(int i = 0;i< resultList.length; i++) {
        if (originList[i] != resultList[i]) {
          isSame = false;
          break;
        }
      }
      expect(isSame, false);
    });

    test('Disorder result diff rate should less than param', () {
      var resultList = disorderMnemonic.shuffle(originList, 0.5);
      var diffItemCount = 0;
      for(int i = 0;i< resultList.length; i++) {
        if (originList[i] != resultList[i]) {
          diffItemCount ++;
        }
      }
      double diffRate = diffItemCount / originList.length;
      expect(true, diffRate - 0.5 > 0);
    });
  });
}