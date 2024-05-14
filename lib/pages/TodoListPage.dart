import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pracriver/layouts/SideMenuBar.dart';
import 'package:pracriver/layouts/TodoAppBar.dart';
import 'package:pracriver/pages/TodoAddPage.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  List<String> todoList = [];
  List<bool> isEnableList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar.getAppBar(),
      drawer: SideMenuBar.getSideMenuBar(context),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Visibility(
              visible: isEnableList[index],
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  onTap: (){
                    setState(() {
                      isEnableList[index] = false;
                    });
                  },
                ),
              )
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //ルーティング処理になってる
          // final newListText = await Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     // class(ページ)を返す
          //     return TodoAddPage();
          //   }),
          // );
          final newListText = await context.pushNamed<String>('todo.create');
          // キャンセルした場合は newListText が null となるので注意
          if (newListText != null) {

            setState(() {
              isEnableList.add(true);
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}