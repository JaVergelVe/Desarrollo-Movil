import 'package:flutter/material.dart';

class Hola extends StatelessWidget{
  const Hola({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Esto es mi app"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hola primer texto"),
              Text("Hola segundo texto"),
              Text("Hola tercer texto"),
              Text("Hola cuarto texto")
            ],
          ),
        ),
      );
  }
}