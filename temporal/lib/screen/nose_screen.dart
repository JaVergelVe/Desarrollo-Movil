import 'package:flutter/material.dart';

class Nose extends StatefulWidget{
  const Nose({Key? key}) : super(key: key);

  @override
  State<Nose> createState() => _NoseState();
}

class _NoseState extends State<Nose> {
  int pulsos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButtom(icon: Icons.add, onPress: (){
            setState(() {
              pulsos++;
            });
          }),
          CustomButtom(icon: Icons.remove, onPress: (){
            setState(() {
              pulsos--;
            });
          })
        ],
      ),
      body: Center(child: Text("pulsos $pulsos")),
    );
  }
}

class CustomButtom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const CustomButtom({Key? key, 
    required this.icon,
    required this.onPress
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPress();
      },
    child:  Icon(icon),
    );
  }
}