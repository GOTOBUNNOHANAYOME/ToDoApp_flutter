import 'package:flutter/material.dart';
import 'package:pracriver/layouts/SideMenuBar.dart';
import 'package:pracriver/pages/TodoAddPage.dart';
import 'package:pracriver/layouts/TodoAppBar.dart';
import 'package:pracriver/pages/TodoListPage.dart';
import 'package:go_router/go_router.dart';
import 'package:pracriver/routes/TodoRouter.dart';

void main() {
  runApp(ToolApp());
}

class ToolApp extends StatelessWidget {
  ToolApp({super.key});

  final _router = TodoRouter.getRouter();

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp.router(
      title: 'TodoApp',
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
    );
    // return MaterialApp(
    //   title: 'ToolApp',
    //   theme: ThemeData(
    //     primarySwatch: Colors.orange
    //   ),
    //   home: TodoListPage(),
    // );
  }
}

