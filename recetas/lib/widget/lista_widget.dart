// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:recetas/config/helpers/get_petition.dart';
import 'package:recetas/domain/entities/coctel.dart';

class ListaWidget extends StatefulWidget {
  final String id;

  const ListaWidget({super.key, required this.id});

  @override
  State<ListaWidget> createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  final petition = GetPetition();
  late Coctel receta = Coctel(id: '0');

  void getData() async {
    Coctel response = await petition.getProductoUnico(widget.id);
    receta = response;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (receta.id == '0') {
      return const Center(
        child: LinearProgressIndicator(),
      );
    }
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('${receta.bebida}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: Text(
                    receta.bebida.toString(),
                    style: const TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 10),
                    Icon(Icons.edit),
                  ],
                )
              ]),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                receta.imagen.toString(),
                width: size.width * 0.3,
                height: size.width * 0.3,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedScale(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    scale: 1,
                    child: child,
                  );
                },
              ),
            ),
            Center(child: ViewTagClass(tags: receta.tags)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Instrucciones ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 85, 85, 85),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${receta.instrucciones}",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Center(child: list_ingredient(ingrediente: receta.ingredientes))
          ],
        ),
      ),
    );
  }
}

class ViewTagClass extends StatelessWidget {
  List? tags;

  ViewTagClass({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: tags?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4, crossAxisCount: 4, crossAxisSpacing: 2),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Chip(label: Text("${tags?[index]}"));
        });
  }
}

class list_ingredient extends StatelessWidget {
  dynamic ingrediente;
  list_ingredient({super.key, required this.ingrediente});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ingrediente.length,
        itemBuilder: (context, index) {
          if (ingrediente[index]["ingrediente"] == '') {
            return null;
          }
          return ListTile(
            onTap: () {},
            tileColor: const Color.fromARGB(255, 221, 234, 255),
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 214, 214, 214), width: 0.5),
            ),
            title: Row(
              children: [
                Expanded(child: Text(ingrediente[index]["ingrediente"])),
                Text("${ingrediente[index]['cantidad']}"),
              ],
            ),
          );
        });
  }
}
