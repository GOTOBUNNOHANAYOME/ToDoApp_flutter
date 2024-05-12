import 'package:flutter/material.dart';

class TodoAppBar{

  static AppBar getAppBar(){
    return AppBar(
        title: const Text('Todoリスト'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.face, color: Colors.white,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.email, color: Colors.white,),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.white,),
              onPressed: () {},
            ),
          ],
    );
  }
}