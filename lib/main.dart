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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
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
      body: Center(
        //builderメソッドでデータを元に表示
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(todoList[index]),
              ),
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
// class TodoListPage extends StatelessWidget {
//   const TodoListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.menu),
//         title: const Text('Todoリスト'),
//         backgroundColor: Colors.orange,
//         centerTitle: true,
//         actions: <Widget>[
//             IconButton(
//               icon: Icon(Icons.face, color: Colors.white,),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.email, color: Colors.white,),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.favorite, color: Colors.white,),
//               onPressed: () {},
//             ),
//           ],
//       ),
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//             Card(
//               child: ListTile(
//                 title: Text('タマネギ'),
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           //ルーティング処理になってる
//           final newListText = await Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) {
//               // class(ページ)を返す
//               return TodoAddPage();
//             }),
//           );
//           if (newListText != null) {
//             // キャンセルした場合は newListText が null となるので注意
//           }
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class TodoAddPage extends StatelessWidget {
//   const TodoAddPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todoリスト'),
//         centerTitle: true,
//         backgroundColor: Colors.orange,
//         actions: <Widget>[
//           IconButton(
//             onPressed: (){},
//             icon: Icon(Icons.face, color: Colors.white,)
//           ),
//           IconButton(
//             onPressed: (){}, 
//             icon: Icon(Icons.mail, color: Colors.white,)
//           ),
//           IconButton(
//             onPressed: (){}, 
//             icon: Icon(Icons.favorite, color: Colors.white)
//           )
//         ],
//       ),
//       body: Container(
//         padding: EdgeInsets.all(64),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(),
//             const SizedBox(height: 8,),
//             Container(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange
//                 ),
//                 onPressed: (){},
//                 child: Text('リスト追加', style: TextStyle(color: Colors.white),),
//               )
//             ),
//             const SizedBox(height: 8,),
//             Container(
//               width: double.infinity,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('キャンセル')
//               ),
//             )
//           ],
//         ),
//       )
//     );
//   }
// }
