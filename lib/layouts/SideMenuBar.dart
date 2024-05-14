import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenuBar{

  static Drawer getSideMenuBar(BuildContext context){
    return Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('ホーム'),
              onTap: () {
                GoRouter.of(context).goNamed('home');
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
      );
  }

}