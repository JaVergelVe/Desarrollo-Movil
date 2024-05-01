import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  void showCustomSnackBar(context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("goal"),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar"),
      ),
      body: const _SnackView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackBar(context);
        },
        label: const Text("Mostrar"),
        icon: const Icon(Icons.search),
      ),
    );
  }
}

class _SnackView extends StatelessWidget {
  const _SnackView();

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // bloquea que cierre el dialogo,
      builder: (context) {
        return AlertDialog(
          title: const Text('Titutlo'),
          content: const Text('Contenido del dialogo'),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: const Text('Aceptar')),
            FilledButton(
                onPressed: () => context.pop(), child: const Text('Cancelar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        FilledButton(
          onPressed: () {
            showAboutDialog(
              applicationName: "Nombre",
              context: context,
              children: [
                const Text("esto es n dialogo"),
              ],
            );
          },
          child: const Text("licencias"),
        ),
        FilledButton(
          onPressed: () {
            openDialog(context);
          },
          child: const Text("Otro texto"),
        ),
      ],
    ));
  }
}
