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

  dynamic items = [];

  void getData() async {
    var response = await petition.getInfo(widget.idBebida);
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
    return const Scaffold(
      body: Center(
        child: Text("data")
      )
    );
  }
}