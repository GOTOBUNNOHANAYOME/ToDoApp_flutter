import 'package:flutter/material.dart';
import 'package:pracriver/layouts/SideMenuBar.dart';
import 'package:pracriver/pages/TodoAddPage.dart';
import 'package:pracriver/layouts/TodoAppBar.dart';
import 'package:pracriver/pages/TodoListPage.dart';

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

