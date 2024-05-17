// ignore_for_file: use_build_context_synchronously

import 'package:cinemapedia/config/helpers/get_petition.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget{
  static const name = "login_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final petition = GetPetition();

  final _formKey = GlobalKey<FormState>();
  final _idUserController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  dynamic info = [];

  Future<void> _submitForm() async {
    var email = _emailController.text;
    var password = _passwordController.text;
    var idUser = _idUserController.text;
    var response = await petition.getInfo(idUser);

    info = response;

    if (_formKey.currentState?.validate() ?? false) {
      if (email == info["email"] && password == info["password"]) {
        context.go('/home');
      } else {
        // ignore: avoid_print
        print("error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _idUserController,
                decoration: const InputDecoration(labelText: 'Id'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su id';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su correo electrónico';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor ingrese un correo electrónico válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}