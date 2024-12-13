import 'package:aeth_analatica/8/model.dart';
import 'package:flutter/material.dart';


class CounterProvider with ChangeNotifier {
  final CounterModel _counterModel = CounterModel();

  int get counter => _counterModel.counter;

  void increment() {
    _counterModel.increment();
    notifyListeners();
  }

  void decrement() {
    _counterModel.decrement();
    notifyListeners();
  }
}
