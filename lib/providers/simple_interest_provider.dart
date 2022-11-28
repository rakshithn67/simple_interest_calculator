import 'package:flutter/material.dart';

class SiProvider with ChangeNotifier {
  final _principalController = TextEditingController();
  final _roiController = TextEditingController();
  final _termController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String _displayResult = '';
  final List<String> _currencies = ['Rupees', 'Dollar', 'Euro'];
  late String _currentItemSelected = _currencies[0];
  late bool _isPressed = false;

  TextEditingController get principalController => _principalController;
  TextEditingController get roiController => _roiController;
  TextEditingController get termController => _termController;
  GlobalKey<FormState> get formKey => _formKey;
  String get displayResult => _displayResult;
  List get currencies => _currencies;
  String get currentItemSelected => _currentItemSelected;
  bool get isPressed => _isPressed;

  currentItemSelection(newItemValue) {
    _currentItemSelected = newItemValue;
    notifyListeners();
  }

  calculateTotalReturns() {
    double principal = double.parse(_principalController.text);
    double roi = double.parse(_roiController.text);
    double term = double.parse(_termController.text);
    double totalPayableAmount = principal + (principal * roi * term) / 100;
    String result =
        'After $term years ,your investment will be worth ${totalPayableAmount.toStringAsFixed(0)} $_currentItemSelected ';

    _displayResult = result;
    _isPressed = true;
    notifyListeners();
  }

  reset() {
    _principalController.text = '';
    _roiController.text = '';
    _termController.text = '';
    _currentItemSelected = _currencies[0];
    _displayResult = '';
    _isPressed = false;
    notifyListeners();
  }
}
