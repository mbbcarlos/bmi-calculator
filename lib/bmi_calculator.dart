import 'dart:math';

class BMICalculatorB {
  final int height;
  final int weight;
  double _bmi = 0.0;
  BMICalculatorB({required this.height, required this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    }
    if (_bmi > 18.5) return 'Normal';

    return 'Underweight';
  }

  String getTip() {
    if (_bmi >= 25) {
      return 'Maybe more exercise and less cookies OR you\re an athlete ;).';
    }
    if (_bmi > 18.5) return 'Everything seems gucci to me!';

    return 'Maybe go eat a cookie.';
  }
}
