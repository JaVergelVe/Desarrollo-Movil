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
    return FutureBuilder<dynamic>(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text(info[0]['strDrink']),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10.0),
                    Text(
                      'Category: ${info[0]['strCategory']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Alcoholic: ${info[0]['strAlcoholic']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Glass: ${info[0]['strGlass']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Instructions: ${info[0]['strInstructions']}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          image: info[0]['strDrinkThumb'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Loading...'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}