import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of(context,listen:false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
