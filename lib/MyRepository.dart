
import 'dart:convert';

import 'Album.dart';
import 'package:http/http.dart' as http;

class CounterRepository{

  int increment(int count) =>count+1;

  Future<Album> loadAlbum() async{
    final response =  await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}