import 'package:dart_numerics/dart_numerics.dart';

class FatCalculatorBrain {
  FatCalculatorBrain({this.height = 0, this.difference = 0, this.gender = 0});

  final int height;
  final int difference;
  final int gender;

  double _fat = 0;

  String calculateFat() {
    if (gender == 0)
      _fat = (495 /
              ((1.0324 - 0.19077 * log10(difference)) +
                  (0.15456 * log10(height)))) -
          450;
    else
      _fat = (495 /
              ((1.29579 - 0.35004 * log10(difference)) +
                  (0.22100 * log10(height)))) -
          450;
    return _fat.toStringAsFixed(1);
  }

  String getResult() {
    if (_fat <= 5) {
      return 'Essential fat';
    } else if (_fat <= 13) {
      return 'Athletes';
    } else if (_fat <= 17) {
      return 'Fitness';
    } else if (_fat <= 24) {
      return 'Average';
    } else {
      return 'Obese';
    }
  }
}
