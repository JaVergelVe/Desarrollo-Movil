import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:receta/screens/bebida_screen.dart';
import 'package:receta/screens/receta_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indicador = 0;
  static final List _menu = [
    const RecetaScreen(),
    const BebidaScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola aplicacion"),
      ),
      body: _menu[_indicador],
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(5),
          children: [
            ListTile(
              title: Text("Receta"),
              onTap: (){
                _indicador = 0;
                setState(() {});
                Navigator.pop(context);
              },
              ),
            ListTile(
              title: Text("Bebidas"),
              onTap: (){
                _indicador = 1;
                setState(() {});
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}