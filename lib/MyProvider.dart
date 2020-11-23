import 'package:flutter/cupertino.dart';
import 'package:widget_test/MyRepository.dart';
import 'package:http/http.dart';

class CounterProvider extends ChangeNotifier{
  final CounterRepository repository;
  int count = 0;
  CounterProvider(this.repository) : super();

  increment(){
    count = repository.increment(count);
    print('count  is $count');
    notifyListeners();
  }


}