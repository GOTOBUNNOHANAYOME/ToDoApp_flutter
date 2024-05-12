import 'package:flutter/material.dart';

void main() {
  runApp(const ToolApp());
}

class ToolApp extends StatelessWidget {
  const ToolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToolApp',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: TodoListPage(),
    );
  }
}

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
      appBar: AppBar(
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
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('メニュー1'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('メニュー2'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('メニュー3'),
              onTap: () {
                
              },
            )
          ],
        ),
      ),
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
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // class(ページ)を返す
              return TodoAddPage();
            }),
          );

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
      appBar: AppBar(
        title: Text('Todoリスト'),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.face, color: Colors.white,)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.mail, color: Colors.white,)
          ),
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.favorite, color: Colors.white)
          )
        ],
      ),
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
                  Navigator.of(context).pop(_text);
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
