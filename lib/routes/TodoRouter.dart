
// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pracriver/pages/TodoAddPage.dart';
import 'package:pracriver/pages/TodoListPage.dart';

class TodoRouter{

  static GoRouter getRouter(){
    return GoRouter(
      initialLocation: '/',
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => TodoListPage(),
        ),
        GoRoute(
          path: '/todo/create',
          name: 'todo.create',
          builder: (context, state) => TodoAddPage(),
        ),
        // GoRoute(
        //   path: '/todo/show',
        //   name: 'todo.show',
        //   builder: (context, state) => TodoShow(),
        // ),
      ]
    );
  }
}