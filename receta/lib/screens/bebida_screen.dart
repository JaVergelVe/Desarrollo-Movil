import 'package:flutter/material.dart';
import 'package:receta/config/helpers/get_peticion.dart';

class BebidaScreen extends StatefulWidget{
  const BebidaScreen({Key? key}) : super(key: key);

  @override
  State<BebidaScreen> createState() => _BebidaScreenState();
}

class _BebidaScreenState extends State<BebidaScreen> {
  final petition = GetPetition();

  dynamic items = [];

  void getData() async {
    var response = await petition.getBebida();
    items = response["drinks"];
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    items[index]["strDrinkThumb"],
                    width: size.width*0.2,
                  ),
                ),
                const SizedBox(width: 10,),
                Text(items[index]["strDrink"])
              ],
            ),
          ],
        );
      }
    );
  }
}