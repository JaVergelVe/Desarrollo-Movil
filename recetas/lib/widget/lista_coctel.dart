import 'package:flutter/material.dart';
import 'package:recetas/domain/entities/coctel.dart';
import 'package:recetas/widget/lista_widget.dart';

// ignore: camel_case_types
class lista_coctel extends StatelessWidget {
  final List<Coctel> coctel;

  const lista_coctel({super.key, required this.coctel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: coctel.length,
      // scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListaWidget(id: coctel[index].id),
              ),
            );
          },
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        coctel[index].imagen ?? '',
                        width: size.width * 0.2,
                        height: size.width * 0.2,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          }
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        coctel[index].bebida ?? '',
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
