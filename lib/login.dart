import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/material/text_button.dart';
import 'package:pruebafl/new_account.dart';

import 'home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Contenedor morado como fondo superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF6772e5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0), // Ajusta el radio de las esquinas
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Image.asset(
                  'assets/LOGO2.PNG',
                  width: 280,
                ),
              ),
            ),
          ),
          // Contenedor blanco como fondo inferior
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(

              color: Color.fromARGB(245,245,245,255),
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
          // Contenido central
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 30,
            right: 30,
            height: 500,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Column(

                    children: [

                      Text(

                        'Bienvenido', // Texto arriba del TextField
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20), // Espacio entre el texto y el TextField
                      ObscuredTextFieldEmail(),
                      SizedBox(height: 20),
                      ObscuredTextFieldSample(),

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Login(),
                            ),
                          );
                        },
                        child: Text("Olvidé mi contraseña"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => const Home(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(250, 50),
                          primary: const Color(0xFF6772e5), // Cambia el color de fondo del botón
                          onPrimary: Colors.white,
                        ),
                        child: Text('LOGIN',
                          style: TextStyle(
                          fontSize: 18, // Tamaño de fuente más grande
                          fontWeight: FontWeight.bold, // Texto en negritas,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos horizontalmente en el Row
                    children: [
                      Text(
                        '¿No tienes cuenta?', // Texto antes del botón
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => const NewAccount(),
                            ),
                          );
                        },
                        child: Text("REGÍSTRATE"),
                      ),
                    ],
                  ),
                ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              height: 2, // Ajusta la altura del divisor
                            ),
                          ),
                          Text(" O inicia sesión con "),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              height: 1.5, // Ajusta la altura del divisor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/social-facebook-2019-circle-512.webp',
                      width: 60,
                    ),
                    Image.asset(
                      'assets/66889-logo-google-suite-png-free-photo.png',
                      width: 60,
                    ),
                    Image.asset(
                      'assets/twitter_circle-512.webp',
                      width: 60,
                    ),
                  ],
                ),
                      // Agrega cualquier otro contenido que desees aquí
                    ],

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class ObscuredTextFieldSample extends StatelessWidget {
  const ObscuredTextFieldSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(16),
          labelText: 'Contraseña',
          filled: true, // Set to true to fill the background
          fillColor:  Color.fromARGB(245,245,245,255),

        ),
      ),
    );
  }
}

class ObscuredTextFieldEmail extends StatelessWidget {
  const ObscuredTextFieldEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(16),
          labelText: 'Correo Electrónico',
            filled: true,
            fillColor:  Color.fromARGB(245,245,245,255),


      ),
      ),
    );
  }
}




