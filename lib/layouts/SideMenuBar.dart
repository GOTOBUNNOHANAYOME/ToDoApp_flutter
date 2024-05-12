import 'package:flutter/material.dart';

class SideMenuBar{

  static Drawer getSideMenuBar(){
    return Drawer(
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
      );
  }

}