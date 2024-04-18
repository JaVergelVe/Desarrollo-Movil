// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:recetas/config/helpers/get_petition.dart';
import 'package:recetas/widget/lista_coctel.dart';

class CoctelScreen extends StatefulWidget {
  const CoctelScreen({super.key});

  @override
  State<CoctelScreen> createState() => _CoctelScreenState();
}

class _CoctelScreenState extends State<CoctelScreen> {
  final petition = GetPetition();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: petition.getProducto(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return lista_coctel(coctel: snapshot.requireData);
          }
        },
      ),
    );
  }
}
