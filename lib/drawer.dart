import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
     child: ListView(
      children:const  [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.amberAccent
          ),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text('Nak Duongherotey',
            style: TextStyle(fontSize: 18),), 
            accountEmail: Text('herotey168@gamil.com'),
            currentAccountPictureSize: Size.square(50),
            ))
      ],
     ),
    );
  }
}