// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parcial1/config/helpers/get_peticion.dart';

class InfoBebidas extends StatefulWidget {
  final String idBebida;
  const InfoBebidas({super.key, required this.idBebida});
  
  @override
  State<InfoBebidas> createState() => _InfoBebidas();
}

class _InfoBebidas extends State<InfoBebidas> {
  final petition = GetPetition();

  dynamic info = [];

  void getData() async {
    var response = await petition.getInfo(widget.idBebida);
    info = response["drinks"];
    setState(() {});
  }
  
  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 300)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Text("Drink : " + info[0]["strDrink"]),
                  Text("Category: " + info[0]["strCategory"]),
                  Text("Alcoholic: " + info[0]["strAlcoholic"]),
                  Text("Glass: " + info[0]["strGlass"]),
                  Text("Instructions: " + info[0]["strInstructions"]),
                  Image.network(info[0]["strDrinkThumb"]),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}