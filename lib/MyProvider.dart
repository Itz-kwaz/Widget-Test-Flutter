import 'package:flutter/cupertino.dart';
import 'package:widget_test/MyRepository.dart';
import 'Album.dart';

class CounterProvider extends ChangeNotifier{
  final CounterRepository repository;
  int count = 0;
  Album album = Album(id: 2,title: 'Hello',userId: 24);
  CounterProvider(this.repository) : super();

  increment(){
    count = repository.increment(count);
    print('count  is $count');
    notifyListeners();
  }

  Future<void> getAlbum() async{
    album = await  repository.loadAlbum();
    notifyListeners();
  }


}