import 'package:flutter/material.dart';
import 'package:pracriver/layouts/SideMenuBar.dart';
import 'package:pracriver/layouts/TodoAppBar.dart';
import 'package:go_router/go_router.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {

  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar.getAppBar(),
      drawer: SideMenuBar.getSideMenuBar(context),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text, style: TextStyle(color: Colors.orange),),
            TextField(
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                onPressed: (){
                  context.go('/');
                  // Navigator.of(context).pop(_text);
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white),),
              )
            ),
            const SizedBox(height: 8,),
          ],
        ),
      )
    );
  }
}
