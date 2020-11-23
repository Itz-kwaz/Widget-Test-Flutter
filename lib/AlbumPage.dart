import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_test/MyProvider.dart';

class AlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CounterProvider>(context,listen:true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: model.getAlbum,
        child: Icon(Icons.network_check,color: Colors.white),
      ),
      body: Center(
        child: Text(model.album.title,
        style: Theme.of(context).textTheme.headline4,),
      ),
    );
  }
}
