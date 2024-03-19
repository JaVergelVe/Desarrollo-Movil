import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String id;
  const ListWidget({Key? key, required this.id}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista widget"),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("uno"),
            Text("dos")
          ],
        )
      ),
    );
  }
}