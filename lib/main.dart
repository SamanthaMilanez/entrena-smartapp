import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pruebafl/login.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
      home: const GetStarted(),
    );
  }
}

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
    // Agrega aquí cualquier lógica de inicialización si es necesario.
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration (milliseconds: 5500),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const Login())));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              child: Lottie.asset('assets/animation_lmchp5fe.json'),
            ),
            SizedBox(height: 10), // Espacio entre los contenedores
            Container(
              height: 180, // Ajusta la altura según tus necesidades
              width: 180, // Ajusta el ancho según tus necesidades
              child: Image.asset('assets/Logo.PNG'), // Reemplaza 'tu_imagen.png' con la ruta de tu imagen
            ),
          ],
        ),
      ),
    );
  }
}





