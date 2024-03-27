import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final String id;
  const ListWidget({super.key, required this.id});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista widget"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("uno"),
            Text("dos")
          ],
        )
      ),
    );
  }
}