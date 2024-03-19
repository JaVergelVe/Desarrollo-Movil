import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BebidaScreen extends StatelessWidget{
  BebidaScreen({Key? key}) : super(key: key);

  final List<String> items = [
    "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      }
    );
  }
}