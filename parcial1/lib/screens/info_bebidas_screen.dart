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
      appBar: AppBar(
        title: const Text('Drink Details'),
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: Future.delayed(const Duration(milliseconds: 500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Drink: ${info[0]['strDrink']}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Text('Category: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(info[0]['strCategory']),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Text('Alcoholic: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(info[0]['strAlcoholic']),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Text('Glass: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(info[0]['strGlass']),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Instructions: ${info[0]['strInstructions']}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10.0),
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder.png',
                      image: info[0]['strDrinkThumb'],
                      width: double.infinity,
                    ),
                  ],
                ),
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